from datetime import date, timedelta, datetime
from typing import Optional

# from django.core.exceptions import ValidationError
from django.db import models
from django.db.models import Model
from rest_framework.exceptions import ValidationError


class BaseModel(models.Model):
    """
    基类，公共字段
    """

    c_time = models.DateTimeField("创建时间", auto_now_add=True, db_index=True)
    u_time = models.DateTimeField("更新时间", auto_now=True, db_index=True)
    is_delete = models.BooleanField("逻辑删除", default=False, db_index=True)

    class Meta:
        # 抽象类，用于继承，迁移时不会创建
        abstract = True


class Pasture(BaseModel):
    """
    牧场类
    """

    name = models.CharField("牧场", max_length=100, unique=True)
    province = models.CharField(verbose_name="省份", max_length=25, db_index=True)
    city = models.CharField(verbose_name="城市", max_length=25, db_index=True)
    district = models.CharField(verbose_name="区/县", max_length=25, db_index=True)
    address_detail = models.TextField(
        verbose_name="详细地址", max_length=500, default="", blank=True
    )

    def __str__(self):
        return self.name

    class Meta:
        db_table = "pasture"  # 表名
        verbose_name = "牧场"  # 站点显示名
        verbose_name_plural = verbose_name


class RFID(models.Model):
    """
    RFID 类
    """

    rfid_id = models.CharField("RFID卡号", max_length=40, unique=True)
    is_invalid = models.BooleanField("已作废", default=False, db_index=True)
    pasture = models.ForeignKey(
        Pasture, verbose_name="牧场", on_delete=models.CASCADE, related_name="rfids"
    )

    def __str__(self):
        return self.rfid_id

    @property
    def is_bound(self) -> bool:
        """
        是否已绑定
        """
        return RFIDCage.check_bound(self)

    def check_useful(self):
        """
        检查是否可用
        """
        if self.is_bound:
            raise ValidationError("该RFID卡已经绑定了笼子!")
        if self.is_invalid:
            raise ValidationError("该RFID卡已经废弃!")

    def bound_cage(self, cage):
        """
        与犊牛笼绑定
        """
        self.check_useful()
        if cage.is_bound:
            raise ValidationError(f"犊牛笼({cage.cage_id})已经绑定RFID卡了!")

        RFIDCage.objects.create(rfid=self, cage=cage)

    @property
    def cage(self):
        """
        获取RFID绑定的犊牛笼
        """
        if not self.is_bound:
            raise ValidationError("该RFID卡未绑定笼子!")
        return self.rfid_cage.cage

    @property
    def calf(self):
        """
        获取RFID绑定的犊牛笼的犊牛
        """
        if not self.is_bound:
            raise ValidationError("该RFID卡未绑定笼子!")
        cage = self.rfid_cage.cage
        return cage.calf

    @property
    def feeding_standard(self):
        """
        获取RFID绑定的犊牛笼的犊牛的喂养标准
        """
        return self.calf.feeding_standard

    @property
    def history_data(self):
        """
        历史数据
        """
        return HistoryData.objects.filter(rfid_id=self.rfid_id).first()

    class Meta:
        db_table = "rfid"  # 表名
        verbose_name = "RFID"  # 站点显示名
        verbose_name_plural = verbose_name


class Cage(models.Model):
    """
    犊牛笼类
    """

    # Cage_RFID = models.OneToOneField(RFID, on_delete=models.SET_DEFAULT, default=9999, help_text='RFID卡号')

    cage_id = models.CharField("笼号编码", max_length=40, unique=True)
    area = models.CharField(
        "区域", max_length=10, null=True, blank=True, default="", db_index=True
    )
    area_id = models.CharField(
        "区号", max_length=10, null=True, blank=True, default="", db_index=True
    )
    descr = models.CharField("备注", max_length=1000, null=True, blank=True, default="")
    pasture = models.ForeignKey(
        Pasture, verbose_name="牧场", on_delete=models.CASCADE, related_name="cages"
    )

    def __str__(self):
        return self.cage_id

    @property
    def is_bound(self) -> bool:
        """
        是否已绑定
        """
        return RFIDCage.check_bound(cage=self)

    @property
    def rfid(self):
        if not self.is_bound:
            return None
        return self.rfid_cage.rfid

    @property
    def feeding_standard(self):
        return self.rfid.feeding_standard

    @property
    def history_data(self):
        return self.rfid.history_data

    def has_calf(self) -> bool:
        """
        是否有犊牛了
        """
        return CalfCage.check_bound(cage=self)

    @property
    def calf(self):
        """
        笼中的犊牛
        """
        if not self.has_calf():
            raise ValidationError("该犊牛笼没有牛!")
        return self.calf_cage.calf

    def bound_rfid(self, rfid):
        """
        与RFID卡绑定
        """
        rfid.check_useful()
        if self.is_bound:
            raise ValidationError("该笼子已经绑定RFID卡了!")

        RFIDCage.objects.create(rfid=rfid, cage=self)

    def put_calf(self, calf):
        if not self.is_bound:
            raise ValidationError("该笼子还未绑定RFID卡!")
        if self.has_calf():
            raise ValidationError("该笼子已经有犊牛了!")
        if calf.is_in_cage:
            raise ValidationError(f"犊牛({calf.calf_id})已经入过笼了!")
        CalfCage.objects.create(calf=calf, cage=self)

    class Meta:
        db_table = "cage"  # 表名
        verbose_name = "犊牛笼"  # 站点显示名
        verbose_name_plural = verbose_name


class RFIDCage(models.Model):
    rfid = models.OneToOneField(
        RFID,
        verbose_name="RFID",
        on_delete=models.CASCADE,
        related_name="rfid_cage",
        unique=True,
    )
    cage = models.OneToOneField(
        Cage,
        verbose_name="犊牛笼",
        on_delete=models.CASCADE,
        related_name="rfid_cage",
        unique=True,
    )

    def __str__(self):
        return f"{self.rfid.rfid_id}-{self.cage.cage_id}"

    @classmethod
    def bound(cls, rfid: RFID, cage: Cage):
        """
        绑定RFID卡与犊牛笼
        """
        if not (
            cls.objects.filter(rfid=rfid).exists()
            and cls.objects.filter(cage=cage).exists()
        ):
            cls.objects.create(rfid=rfid, cage=cage)

    @classmethod
    def check_bound(
        cls, rfid: Optional[RFID] = None, cage: Optional[Cage] = None
    ) -> bool:
        if rfid:
            return cls.objects.filter(rfid=rfid).exists()
        if cage:
            return cls.objects.filter(cage=cage).exists()

    class Meta:
        db_table = "rfid_cage"  # 表名
        verbose_name = "RFID & 犊牛笼"  # 站点显示名
        verbose_name_plural = verbose_name


class Calf(models.Model):
    """
    犊牛
    """

    SEXES = ((1, "公"), (2, "母"))
    calf_id = models.CharField("犊牛耳标ID", max_length=40, unique=True)
    date_of_birth = models.DateField("出生日期", db_index=True)
    sex = models.SmallIntegerField("性别", choices=SEXES, default=2, db_index=True)
    weight_day_add = models.FloatField("日增重", default=1.0, db_index=True)
    birth_weight = models.FloatField("出生体重(kg)", default=0.0, db_index=True)
    # Age_in_days = models.IntegerField('日龄', default=1, help_text='日龄')
    adjusted_feeding = models.FloatField("临时调整饲喂量", default=0.0, db_index=True)
    descr = models.CharField("备注", max_length=1000, null=True, blank=True, default="")
    pasture = models.ForeignKey(
        Pasture, verbose_name="牧场", on_delete=models.CASCADE, related_name="calves"
    )

    def __str__(self):
        return self.calf_id

    @property
    def cage(self):
        if not self.is_in_cage:
            return None
        return self.calf_cage.cage

    @property
    def rfid(self):
        return self.cage.rfid

    @property
    def is_in_cage(self) -> bool:
        """
        是否入笼
        """
        return CalfCage.check_bound(self)

    @property
    def cage_entry_time(self):
        """
        入笼时间
        """
        if self.is_in_cage:
            return self.calf_cage.cage_entry_time

    def enter_cage(self, cage):
        """
        入笼
        """
        if self.is_in_cage:
            raise ValidationError("该犊牛已经在笼子里了!")
        if cage.has_calf():
            raise ValidationError(f"笼子({cage.cage_id})已经有犊牛了!")
        CalfCage.objects.create(cage=cage, calf=self)

    @property
    def feeding_standard(self):
        """
        饲养标准
        """
        return FeedingStandard.get_calf_standard(self)

    @property
    def age_in_days(self) -> int:
        """
        日龄
        """
        return (date.today() - self.date_of_birth).days

    @property
    def history_data(self):
        return self.rfid.history_data

    class Meta:
        db_table = "calf"  # 表名
        verbose_name = "犊牛"  # 站点显示名
        verbose_name_plural = verbose_name


class CalfCage(models.Model):
    calf = models.OneToOneField(
        Calf,
        verbose_name="犊牛",
        on_delete=models.CASCADE,
        related_name="calf_cage",
        unique=True,
    )
    cage = models.OneToOneField(
        Cage,
        verbose_name="犊牛笼",
        on_delete=models.CASCADE,
        related_name="calf_cage",
        unique=True,
    )
    cage_entry_time = models.DateTimeField("入笼时间", auto_now_add=True, db_index=True)

    def __str__(self):
        return f"{self.calf.calf_id}-{self.cage.cage_id}"

    @classmethod
    def check_bound(
        cls, calf: Optional[Calf] = None, cage: Optional[Cage] = None
    ) -> bool:
        if calf:
            return cls.objects.filter(calf=calf).exists()
        if cage:
            return cls.objects.filter(cage=cage).exists()

    class Meta:
        db_table = "calf_cage"  # 表名
        verbose_name = "犊牛 & 犊牛笼"  # 站点显示名
        verbose_name_plural = verbose_name


class FeedingStandard(models.Model):
    """
    饲喂标准
    """

    feeding_age = models.SmallIntegerField("日龄", default=1, db_index=True)
    feeding_total_feeding = models.SmallIntegerField("总饲喂量", default=50, db_index=True)
    feeding_up = models.SmallIntegerField("饲喂比例", default=50, db_index=True)
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="feeding_standards",
    )

    @classmethod
    def get_calf_standard(cls, calf: Calf):
        return cls.objects.filter(
            feeding_age=calf.age_in_days, pasture=calf.pasture
        ).first()

    @property
    def calves(self):
        return Calf.objects.filter()

    def get_feeding_date(self, birthday):
        return birthday + timedelta(self.feeding_age)

    class Meta:
        db_table = "feeding_standard"  # 表名
        verbose_name = "饲喂标准"  # 站点显示名
        verbose_name_plural = verbose_name
        unique_together = [["feeding_age", "pasture"]]  # 联合唯一


class RemainingMilk(BaseModel):
    rfid = models.ForeignKey(
        RFID,
        verbose_name="rfid",
        on_delete=models.CASCADE,
        related_name="remaining_milks",
    )
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.CASCADE,
        related_name="remaining_milks",
    )
    date = models.DateTimeField("时间", db_index=True)
    milk_volume = models.FloatField("剩余奶量", default=0.0, db_index=True)

    class Meta:
        db_table = "remaining_milk"  # 表名
        verbose_name = "犊牛剩余奶量"  # 站点显示名
        verbose_name_plural = verbose_name


class HistoryData(BaseModel):
    # 从设备上传至此表数据库

    rfid_id = models.CharField("RFID卡号", max_length=40)
    cage_id = models.CharField("笼号编码", max_length=40)
    calf_id = models.CharField("犊牛耳标ID", max_length=40)
    day_of_birth = models.SmallIntegerField("日龄", null=False)
    area = models.CharField("区域", max_length=10, null=True, blank=True, default="")
    area_id = models.CharField("区号", max_length=10, null=True, blank=True, default="")
    descr = models.CharField("备注", max_length=1000, null=True, blank=True, default="")
    adjusted_feeding = models.SmallIntegerField("临时调整饲喂量", default=0)
    feeding_total_feeding = models.SmallIntegerField("总饲喂量", default=50)
    temp = models.FloatField("饲喂温度", max_length=5, null=True, blank=True, default="")
    mae = models.SmallIntegerField("早晚班次", default=50)
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="history_data",
    )

    class Meta:
        db_table = "history_data"  # 表名
        verbose_name = "历史加奶数据"
        verbose_name_plural = verbose_name
        ordering = ("-c_time",)


class DataUpdateStatus(Model):
    pasture = models.OneToOneField(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="data_update_status",
    )
    u_time = models.DateTimeField("更新时间", default=datetime.now, db_index=True)
    is_synced = models.BooleanField("已同步", default=False, db_index=True)

    class Meta:
        db_table = "data_update_status"  # 表名
        verbose_name = "数据更新状态"
        verbose_name_plural = verbose_name
        ordering = ("-u_time",)


class DeviceLog(BaseModel):
    device_id = models.CharField("设备id", max_length=32, db_index=True)
    power = models.IntegerField("电量（%）", db_index=True)
    milk_temperature = models.FloatField("奶温（℃）", db_index=True)
    boot_time = models.DateTimeField("开机时间", db_index=True)
    shutdown_time = models.DateTimeField("关机时间", db_index=True)
    spare1 = models.CharField("备用1", max_length=10, db_index=True)
    spare2 = models.CharField("备用2", max_length=10, db_index=True)

    class Meta:
        db_table = "device_log"  # 表名
        verbose_name = "设备日志"
        verbose_name_plural = verbose_name
        ordering = ("-u_time",)


class UnlinkCalf(BaseModel):
    """
    出笼犊牛
    """

    SEXES = ((1, "公"), (2, "母"))
    RSNS = ((0, "无"), (1, "断奶"), (2, "死亡"), (3, "其他"))
    calf_id = models.CharField("犊牛编号", max_length=40, unique=True)
    date_of_birth = models.DateField("出生日期", db_index=True)
    sex = models.SmallIntegerField("性别", choices=SEXES, default=2, db_index=True)
    birth_weight = models.FloatField("出生体重(kg)", default=0.0, db_index=True)
    weight_unlink = models.FloatField("出笼体重(kg)", default=0.0, db_index=True)
    date_unlink = models.DateTimeField("出笼时间", db_index=True, default="")
    rsn_unlink = models.IntegerField("出笼原因", choices=RSNS, default=0, db_index=True)
    infor_unlink = models.TextField("出笼备注信息", default="")
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.CASCADE,
        related_name="unlink_calves",
    )

    class Meta:
        db_table = "unlink_calf"  # 表名
        verbose_name = "出笼犊牛"
        verbose_name_plural = verbose_name
        ordering = ("-c_time",)
