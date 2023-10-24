from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from apps.users.models import User, validate_mobile


class AdminUserForm(UserCreationForm):
    """
    superuser的用户表单
    """

    def clean_pasture(self):
        """
        当用户不为超级用户时，工厂必填
        """
        is_superuser = self.cleaned_data.get("is_superuser")
        pasture = self.cleaned_data.get("pasture")
        if not is_superuser and not pasture:
            raise ValidationError("如果用户不是超级用户，牧场字段是必填的。")
        return pasture

    class Meta:
        model = User
        fields = "__all__"


class CustomUserForm(UserCreationForm):
    """
    自定义用户表单用户一级用户创建新用户
    """

    level = forms.ChoiceField(
        choices=[(2, "二级"), (3, "三级")],  # 只允许选2级或3级
    )

    class Meta:
        model = User
        fields = "__all__"


class CustomUserChangeForm(UserChangeForm):
    """
    自定义用户表单用户一级用户创建新用户
    """

    level = forms.ChoiceField(
        choices=[(2, "二级"), (3, "三级")],  # 只允许选2级或3级
    )

    class Meta:
        model = User
        fields = "__all__"
