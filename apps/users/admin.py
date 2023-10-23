from django import forms
from django.contrib import admin
from django.core.exceptions import ValidationError

from apps.users.models import User


class AdminUserFrom(forms.ModelForm):
    """
    superuser的用户表单
    """

    def clean_factory(self):
        """
        当用户不为超级用户时，工厂必填
        """
        is_superuser = self.cleaned_data.get("is_superuser")
        factory = self.cleaned_data.get("factory")
        if not is_superuser and not factory:
            raise ValidationError("如果用户不是超级用户，工厂字段是必填的。")
        return factory

    class Meta:
        model = User
        fields = "__all__"


class CustomUserForm(forms.ModelForm):
    """
    自定义用户表单用户一级用户创建新用户
    """

    class Meta:
        model = User
        exclude = ["user_permissions", "groups", "is_staff", "is_active"]


@admin.register(User)
class UserModelAdmin(admin.ModelAdmin):
    def has_add_permission(self, request):
        user = request.user
        return user.is_superuser or user.level == 1

    def has_change_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level in [1, 2]

    def has_delete_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level == 1

    # 控制可见的用户
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs

        if request.user.level == 1:  # 一级用户
            return qs.filter(factory=request.user.factory)

        return qs.none()  # 其他用户不显示任何数据

    def save_model(self, request, obj, form, change):
        if not (request.user.is_superuser and obj.is_superuser) and obj.level != 1:
            obj.factory = request.user.factory
        obj.is_staff = True
        super().save_model(request, obj, form, change)

    def get_form(self, request, obj=None, **kwargs):
        user = request.user
        if user.is_superuser:
            return AdminUserFrom
        if user.level == 1:
            return CustomUserForm
        return super().get_form(request, obj, **kwargs)

    def has_module_permission(self, request):
        user = request.user
        return user.is_superuser or user.level == 1
