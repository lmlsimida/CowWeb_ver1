# Generated by Django 4.2.6 on 2023-12-11 10:21

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("WebCloud", "0014_autohistorydata_rationhistorydata_delete_historydata"),
    ]

    operations = [
        migrations.AddField(
            model_name="autohistorydata",
            name="data_time_auto",
            field=models.DateTimeField(
                blank=True, null=True, verbose_name="DataTimeAuto"
            ),
        ),
        migrations.AddField(
            model_name="rationhistorydata",
            name="data_time_auto",
            field=models.DateTimeField(
                blank=True, null=True, verbose_name="DataTimeAuto"
            ),
        ),
        migrations.AlterField(
            model_name="unlinkcalf",
            name="calf_id",
            field=models.CharField(db_index=True, max_length=40, verbose_name="犊牛编号"),
        ),
    ]
