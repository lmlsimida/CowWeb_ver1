# Generated by Django 4.2.6 on 2023-10-19 07:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Cage",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "Cage_id",
                    models.CharField(
                        help_text="笼号编码",
                        max_length=40,
                        unique=True,
                        verbose_name="笼号编码",
                    ),
                ),
                (
                    "area",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="区域",
                        max_length=10,
                        null=True,
                        verbose_name="区域",
                    ),
                ),
                (
                    "area_id",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="区号",
                        max_length=10,
                        null=True,
                        verbose_name="区号",
                    ),
                ),
                (
                    "descr",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="备注",
                        max_length=1000,
                        null=True,
                        verbose_name="备注",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Feeding",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "FeedingAge",
                    models.SmallIntegerField(
                        default=1, help_text="日龄", verbose_name="日龄"
                    ),
                ),
                (
                    "FeedingTotalFeeding",
                    models.SmallIntegerField(
                        default=50, help_text="总前饲喂量", verbose_name="总饲喂量"
                    ),
                ),
                (
                    "FeedingUp",
                    models.SmallIntegerField(
                        default=50, help_text="饲喂比例", verbose_name="饲喂比例"
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="HistoryData",
            fields=[
                (
                    "id",
                    models.AutoField(
                        help_text="id主键",
                        primary_key=True,
                        serialize=False,
                        verbose_name="id主键",
                    ),
                ),
                (
                    "c_time",
                    models.DateTimeField(auto_now_add=True, verbose_name="创建时间"),
                ),
                ("u_time", models.DateTimeField(auto_now=True, verbose_name="更新时间")),
                ("is_delete", models.BooleanField(default=False, verbose_name="逻辑删除")),
                (
                    "HDS_RFID",
                    models.CharField(
                        help_text="RFID卡号", max_length=40, verbose_name="RFID卡号"
                    ),
                ),
                (
                    "HDS_Cage",
                    models.CharField(
                        help_text="笼号编码", max_length=40, verbose_name="笼号编码"
                    ),
                ),
                (
                    "HDS_Cow",
                    models.CharField(
                        help_text="犊牛耳标ID", max_length=40, verbose_name="犊牛耳标ID"
                    ),
                ),
                (
                    "HDS_Day_of_birth",
                    models.SmallIntegerField(help_text="日龄", verbose_name="日龄"),
                ),
                (
                    "HDS_area",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="区域",
                        max_length=10,
                        null=True,
                        verbose_name="区域",
                    ),
                ),
                (
                    "HDS_area_id",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="区号",
                        max_length=10,
                        null=True,
                        verbose_name="区号",
                    ),
                ),
                (
                    "HDS_descr",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="备注",
                        max_length=1000,
                        null=True,
                        verbose_name="备注",
                    ),
                ),
                (
                    "HDS_Adjusted_feeding",
                    models.SmallIntegerField(
                        default=0, help_text="临时调整饲喂量", verbose_name="临时调整饲喂量"
                    ),
                ),
                (
                    "HDS_FeedingTotalFeeding",
                    models.SmallIntegerField(
                        default=50, help_text="总前饲喂量", verbose_name="总饲喂量"
                    ),
                ),
                (
                    "HDS_Temp",
                    models.FloatField(
                        blank=True,
                        default="",
                        help_text="饲喂温度",
                        max_length=5,
                        null=True,
                        verbose_name="饲喂温度",
                    ),
                ),
                (
                    "HDS_MaE",
                    models.SmallIntegerField(
                        default=50, help_text="早晚班次", verbose_name="早晚班次"
                    ),
                ),
            ],
            options={
                "verbose_name": "历史加奶数据",
                "verbose_name_plural": "历史加奶数据",
            },
        ),
        migrations.CreateModel(
            name="RFID",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "RFID_ID",
                    models.CharField(
                        help_text="RFID卡号",
                        max_length=40,
                        unique=True,
                        verbose_name="RFID卡号",
                    ),
                ),
                (
                    "Use_status",
                    models.SmallIntegerField(
                        choices=[(1, "使用中"), (2, "未使用"), (3, "作废")],
                        default=1,
                        help_text="使用状态:1-使用中,2-未使用,3-作废",
                        verbose_name="使用状态",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Cow_Card",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "Cow_id",
                    models.CharField(
                        help_text="犊牛耳标ID",
                        max_length=40,
                        unique=True,
                        verbose_name="犊牛耳标ID",
                    ),
                ),
                (
                    "date_of_birth",
                    models.DateField(help_text="出生日期", verbose_name="出生日期"),
                ),
                (
                    "Cage_entry_date",
                    models.DateField(help_text="入笼日期", null=True, verbose_name="入笼日期"),
                ),
                (
                    "Cage_out_date",
                    models.DateField(help_text="出笼日期", null=True, verbose_name="出笼日期"),
                ),
                (
                    "Weight_Day_Add",
                    models.IntegerField(default=1, help_text="日增重", verbose_name="日增重"),
                ),
                (
                    "Adjusted_feeding",
                    models.SmallIntegerField(
                        default=0, help_text="临时调整饲喂量", verbose_name="临时调整饲喂量"
                    ),
                ),
                (
                    "descr",
                    models.CharField(
                        blank=True,
                        default="",
                        help_text="备注",
                        max_length=1000,
                        null=True,
                        verbose_name="备注",
                    ),
                ),
                (
                    "Cage_status",
                    models.SmallIntegerField(
                        choices=[(1, "出笼"), (2, "入笼")],
                        default=1,
                        help_text="入笼状态:1-出笼,2-入笼",
                        verbose_name="入笼状态",
                    ),
                ),
                (
                    "Cage_Cow",
                    models.OneToOneField(
                        default=9999,
                        help_text="入住笼号",
                        on_delete=django.db.models.deletion.SET_DEFAULT,
                        to="WebCloud.cage",
                    ),
                ),
                (
                    "RFID",
                    models.OneToOneField(
                        default=9999,
                        help_text="RFID卡号",
                        on_delete=django.db.models.deletion.SET_DEFAULT,
                        to="WebCloud.rfid",
                    ),
                ),
            ],
        ),
    ]
