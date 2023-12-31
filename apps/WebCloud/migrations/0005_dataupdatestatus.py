# Generated by Django 4.2.6 on 2023-11-20 01:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("WebCloud", "0004_alter_calf_adjusted_feeding_and_more"),
    ]

    operations = [
        migrations.CreateModel(
            name="DataUpdateStatus",
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
                    "c_time",
                    models.DateTimeField(
                        auto_now_add=True, db_index=True, verbose_name="创建时间"
                    ),
                ),
                (
                    "u_time",
                    models.DateTimeField(
                        auto_now=True, db_index=True, verbose_name="更新时间"
                    ),
                ),
                (
                    "is_delete",
                    models.BooleanField(
                        db_index=True, default=False, verbose_name="逻辑删除"
                    ),
                ),
                (
                    "is_synced",
                    models.BooleanField(
                        db_index=True, default=False, verbose_name="已同步"
                    ),
                ),
                (
                    "pasture",
                    models.OneToOneField(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        related_name="data_update_status",
                        to="WebCloud.pasture",
                        verbose_name="牧场",
                    ),
                ),
            ],
            options={
                "verbose_name": "数据更新状态",
                "verbose_name_plural": "数据更新状态",
                "db_table": "data_update_status",
                "ordering": ("-u_time",),
            },
        ),
    ]
