from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import AnonymousUser
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from apps.users.models import User


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

    class Meta:
        model = User
        exclude = ["user_permissions", "groups", "is_staff", "is_active"]


@admin.register(User)
class UserModelAdmin(UserAdmin):
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (
            _("Personal info"),
            {"fields": ("first_name", "last_name", "email", "level", "pasture")},
        ),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )

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
            return qs.filter(pasture=request.user.pasture)

        return qs.none()  # 其他用户不显示任何数据

    def save_model(self, request, obj, form, change):
        if not (request.user.is_superuser and obj.is_superuser) and obj.level != 1:
            obj.pasture = request.user.pasture
        obj.is_staff = True
        super().save_model(request, obj, form, change)

    def get_form(self, request, obj=None, **kwargs):
        """
        Use special form during user creation
        """
        defaults = {}
        user = request.user
        if obj is None:
            if user.is_superuser:
                self.add_form = AdminUserForm
            elif user.level == 1:
                self.add_form = CustomUserForm
            defaults["form"] = self.add_form

        defaults.update(kwargs)
        return super().get_form(request, obj, **defaults)

    def has_module_permission(self, request):
        user = request.user
        if isinstance(user, AnonymousUser):
            return False
        return user.is_superuser or user.level == 1
