# Generated by Django 4.2.6 on 2023-12-05 16:11

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("WebCloud", "0011_alter_calfcage_cage_entry_time_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="unlinkcalf",
            name="date_unlink",
            field=models.DateField(
                auto_now_add=True, db_index=True, verbose_name="出笼时间"
            ),
        ),
    ]
