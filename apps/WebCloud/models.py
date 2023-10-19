from django.db import models


# Create your models here.


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


class HistoryData(BaseModel):
    # 从设备上传至此表数据库

    HDS_RFID = models.CharField("RFID卡号", max_length=40, help_text="RFID卡号")
    HDS_Cage = models.CharField("笼号编码", max_length=40, help_text="笼号编码")
    HDS_Cow = models.CharField("犊牛耳标ID", max_length=40, help_text="犊牛耳标ID")
    HDS_Day_of_birth = models.SmallIntegerField("日龄", null=False, help_text="日龄")
    HDS_area = models.CharField(
        "区域", max_length=10, null=True, blank=True, default="", help_text="区域"
    )
    HDS_area_id = models.CharField(
        "区号", max_length=10, null=True, blank=True, default="", help_text="区号"
    )
    HDS_descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )
    HDS_Adjusted_feeding = models.SmallIntegerField(
        "临时调整饲喂量", default=0, help_text="临时调整饲喂量"
    )
    HDS_FeedingTotalFeeding = models.SmallIntegerField(
        "总饲喂量", default=50, help_text="总前饲喂量"
    )
    HDS_Temp = models.FloatField(
        "饲喂温度", max_length=5, null=True, blank=True, default="", help_text="饲喂温度"
    )
    HDS_MaE = models.SmallIntegerField("早晚班次", default=50, help_text="早晚班次")

    class Meta:
        verbose_name = "历史加奶数据"
        verbose_name_plural = verbose_name


class RFID(models.Model):
    status = ((1, "使用中"), (2, "未使用"), (3, "作废"))
    RFID_ID = models.CharField("RFID卡号", max_length=40, unique=True, help_text="RFID卡号")
    Use_status = models.SmallIntegerField(
        "使用状态", choices=status, default=1, help_text="使用状态:1-使用中,2-未使用,3-作废"
    )

    def __str__(self):
        return self.RFID_ID


class Cage(models.Model):
    # Cage_RFID = models.OneToOneField(RFID, on_delete=models.SET_DEFAULT, default=9999, help_text='RFID卡号')

    Cage_id = models.CharField("笼号编码", max_length=40, unique=True, help_text="笼号编码")
    area = models.CharField(
        "区域", max_length=10, null=True, blank=True, default="", help_text="区域"
    )
    area_id = models.CharField(
        "区号", max_length=10, null=True, blank=True, default="", help_text="区号"
    )
    descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )

    # class Meta:
    #     db_table = 'tb_product'
    #     verbose_name = '产品信息'
    #     verbose_name_plural = verbose_name77

    def __str__(self):
        return self.Cage_id


class Feeding(models.Model):
    FeedingAge = models.SmallIntegerField("日龄", default=1, help_text="日龄")
    FeedingTotalFeeding = models.SmallIntegerField(
        "总饲喂量", default=50, help_text="总前饲喂量"
    )
    FeedingUp = models.SmallIntegerField("饲喂比例", default=50, help_text="饲喂比例")


class Cow_Card(models.Model):
    status = ((1, "出笼"), (2, "入笼"))
    Cage_Cow = models.OneToOneField(
        Cage, on_delete=models.SET_DEFAULT, default=9999, help_text="入住笼号"
    )
    RFID = models.OneToOneField(
        RFID, on_delete=models.SET_DEFAULT, default=9999, help_text="RFID卡号"
    )

    Cow_id = models.CharField("犊牛耳标ID", max_length=40, unique=True, help_text="犊牛耳标ID")
    date_of_birth = models.DateField("出生日期", null=False, help_text="出生日期")
    Cage_entry_date = models.DateField("入笼日期", null=True, help_text="入笼日期")
    Cage_out_date = models.DateField("出笼日期", null=True, help_text="出笼日期")
    Weight_Day_Add = models.IntegerField("日增重", default=1, help_text="日增重")
    # Age_in_days = models.IntegerField('日龄', default=1, help_text='日龄')
    Adjusted_feeding = models.SmallIntegerField(
        "临时调整饲喂量", default=0, help_text="临时调整饲喂量"
    )
    descr = models.CharField(
        "备注", max_length=1000, null=True, blank=True, default="", help_text="备注"
    )
    Cage_status = models.SmallIntegerField(
        "入笼状态", choices=status, default=1, help_text="入笼状态:1-出笼,2-入笼"
    )

    def __str__(self):
        return self.Cow_id
