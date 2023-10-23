from django.db import models


class BaseModel(models.Model):
    """
    基类，公共字段
    """

    id = models.AutoField(verbose_name="id主键", primary_key=True, help_text="id主键")
    c_time = models.DateTimeField("创建时间", auto_now_add=True)
    u_time = models.DateTimeField("更新时间", auto_now=True)
    is_delete = models.BooleanField("逻辑删除", default=False)

    class Meta:
        # 抽象类，用于继承，迁移时不会创建
        abstract = True


class Pasture(BaseModel):
    """
    牧场类
    """

    name = models.CharField("工厂名称", max_length=100, unique=True, help_text="工厂名称")
    province = models.CharField(verbose_name="省份", max_length=25)
    city = models.CharField(verbose_name="城市", max_length=25)
    district = models.CharField(verbose_name="区/县", max_length=25)
    address_detail = models.TextField(verbose_name="详细地址", max_length=500, default="")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "pasture"  # 表名
        verbose_name = "牧场"  # 站点显示名
        verbose_name_plural = verbose_name


class HistoryData(BaseModel):
    # 从设备上传至此表数据库

    rfid = models.CharField("RFID卡号", max_length=40, help_text="RFID卡号")
    cage = models.CharField("笼号编码", max_length=40, help_text="笼号编码")
    cow = models.CharField("犊牛耳标ID", max_length=40, help_text="犊牛耳标ID")
    day_of_birth = models.SmallIntegerField("日龄", null=False, help_text="日龄")
    area = models.CharField(
        "区域", max_length=10, null=True, blank=True, default="", help_text="区域"
    )
    area_id = models.CharField(
        "区号", max_length=10, null=True, blank=True, default="", help_text="区号"
    )
    descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )
    adjusted_feeding = models.SmallIntegerField(
        "临时调整饲喂量", default=0, help_text="临时调整饲喂量"
    )
    feeding_total_feeding = models.SmallIntegerField(
        "总饲喂量", default=50, help_text="总前饲喂量"
    )
    temp = models.FloatField(
        "饲喂温度", max_length=5, null=True, blank=True, default="", help_text="饲喂温度"
    )
    mae = models.SmallIntegerField("早晚班次", default=50, help_text="早晚班次")
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


class RFID(models.Model):
    STATUS = ((1, "使用中"), (2, "未使用"), (3, "作废"))
    rfid_id = models.CharField("RFID卡号", max_length=40, unique=True, help_text="RFID卡号")
    use_status = models.SmallIntegerField(
        "使用状态", choices=STATUS, default=1, help_text="使用状态:1-使用中,2-未使用,3-作废"
    )
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="rfids",
    )

    def __str__(self):
        return self.rfid_id

    class Meta:
        db_table = "rfid"  # 表名
        verbose_name = "RFID"  # 站点显示名
        verbose_name_plural = verbose_name


class Cage(models.Model):
    # Cage_RFID = models.OneToOneField(RFID, on_delete=models.SET_DEFAULT, default=9999, help_text='RFID卡号')

    cage_id = models.CharField("笼号编码", max_length=40, unique=True, help_text="笼号编码")
    area = models.CharField(
        "区域", max_length=10, null=True, blank=True, default="", help_text="区域"
    )
    area_id = models.CharField(
        "区号", max_length=10, null=True, blank=True, default="", help_text="区号"
    )
    descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="cages",
    )

    def __str__(self):
        return self.cage_id

    class Meta:
        db_table = "cage"  # 表名
        verbose_name = "笼"  # 站点显示名
        verbose_name_plural = verbose_name


class Feeding(models.Model):
    feeding_age = models.SmallIntegerField("日龄", default=1, help_text="日龄")
    feeding_total_feeding = models.SmallIntegerField(
        "总饲喂量", default=50, help_text="总前饲喂量"
    )
    feeding_up = models.SmallIntegerField("饲喂比例", default=50, help_text="饲喂比例")
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="feedings",
    )

    class Meta:
        db_table = "feeding"  # 表名
        verbose_name = "喂养"  # 站点显示名
        verbose_name_plural = verbose_name


class CowCard(models.Model):
    STATUS = ((1, "出笼"), (2, "入笼"))
    cage_cow = models.OneToOneField(
        Cage, on_delete=models.SET_DEFAULT, default=9999, help_text="入住笼号"
    )
    rfid = models.OneToOneField(
        RFID, on_delete=models.SET_DEFAULT, default=9999, help_text="RFID卡号"
    )

    cow_id = models.CharField("犊牛耳标ID", max_length=40, unique=True, help_text="犊牛耳标ID")
    date_of_birth = models.DateField("出生日期", null=False, help_text="出生日期")
    cage_entry_date = models.DateField("入笼日期", null=True, help_text="入笼日期")
    cage_out_date = models.DateField("出笼日期", null=True, help_text="出笼日期")
    weight_day_add = models.IntegerField("日增重", default=1, help_text="日增重")
    # Age_in_days = models.IntegerField('日龄', default=1, help_text='日龄')
    adjusted_feeding = models.SmallIntegerField(
        "临时调整饲喂量", default=0, help_text="临时调整饲喂量"
    )
    descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )
    cage_status = models.SmallIntegerField(
        "入笼状态", choices=STATUS, default=1, help_text="入笼状态:1-出笼,2-入笼"
    )
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="cow_cards",
    )

    def __str__(self):
        return self.cow_id

    class Meta:
        db_table = "cow_card"  # 表名
        verbose_name = "犊牛卡"  # 站点显示名
        verbose_name_plural = verbose_name
