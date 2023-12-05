# Generated by Django 4.2.6 on 2023-12-05 09:22

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("WebCloud", "0010_rfidcage_bound_time"),
    ]

    operations = [
        migrations.AlterField(
            model_name="calfcage",
            name="cage_entry_time",
            field=models.DateField(
                auto_now_add=True, db_index=True, verbose_name="入笼时间"
            ),
        ),
        migrations.AlterField(
            model_name="remainingmilk",
            name="date",
            field=models.DateField(db_index=True, verbose_name="时间"),
        ),
        migrations.AlterField(
            model_name="rfidcage",
            name="bound_time",
            field=models.DateField(
                auto_now_add=True, db_index=True, verbose_name="绑定时间"
            ),
        ),
        migrations.AlterField(
            model_name="unlinkcalf",
            name="date_unlink",
            field=models.DateField(db_index=True, default="", verbose_name="出笼时间"),
        ),
    ]