import re

from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models

from apps.WebCloud.models import Pasture


def validate_mobile(value):
    if not re.match(r"1[3-9]\d{9}", value):
        raise ValidationError("手机号码格式不正确")


class User(AbstractUser):
    LEVELS = ((1, "一级"), (2, "二级"), (3, "三级"))
    mobile = models.CharField(
        "手机号码",
        max_length=11,
        unique=True,
        help_text="手机号码",
        error_messages={"unique": "手机号码已注册", "max_length": "手机号码长度不正确"},
        validators=[validate_mobile],
    )
    name = models.CharField(
        "姓名",
        max_length=11,
        help_text="姓名",
        error_messages={"max_length": "姓名长度不正确"},
    )
    level = models.IntegerField("等级", choices=LEVELS, default=3)
    pasture = models.ForeignKey(
        Pasture,
        verbose_name="牧场",
        on_delete=models.SET_NULL,
        null=True,
        related_name="users",
    )
    REQUIRED_FIELDS = ["mobile", "name"]  # 在通过 createsuperuser 管理命令创建用户时，将提示输入mobile字段

    def __str__(self):
        return self.username

    class Meta:
        db_table = "tb_user"  # 表名
        verbose_name = "用户"  # 站点显示名
        verbose_name_plural = verbose_name  # 复数显示
