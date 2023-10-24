from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import AnonymousUser
from django.utils.translation import gettext_lazy as _

from apps.users.forms import AdminUserForm, CustomUserForm, CustomUserChangeForm
from apps.users.models import User


@admin.register(User)
class UserModelAdmin(UserAdmin):
    """
    自定义用户admin
    """

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
        """
        只有管理员和level为1的可以新增用户
        """
        user = request.user
        return user.is_superuser or user.level == 1

    def has_change_permission(self, request, obj=None):
        """
        只有管理员和level为1的可以修改用户
        """
        user = request.user
        return user.is_superuser or user.level == 1

    def has_delete_permission(self, request, obj=None):
        """
        只有管理员和level为1的可以删除用户
        """
        user = request.user
        return user.is_superuser or user.level == 1

    # 控制可见的用户
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        # 管理员可以看到所有用户
        if request.user.is_superuser:
            return qs
        # 一级用户只能看到自己牧场的用户
        if request.user.level == 1:  # 一级用户
            return qs.filter(pasture=request.user.pasture)
        # 其他类型用户登录不可管理用户
        return qs.none()  # 其他用户不显示任何数据

    def save_model(self, request, obj, form, change):
        """
        一级用户新建用户时自动将用户牧场设置为自己所在牧场
        """
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
        else:  # 编辑用户
            if user.level == 1:
                defaults["form"] = CustomUserChangeForm

        defaults.update(kwargs)
        return super().get_form(request, obj, **defaults)

    def has_module_permission(self, request):
        """
        只有管理员和一级用户可以管理用户
        """
        user = request.user
        if isinstance(user, AnonymousUser):
            return False
        return user.is_superuser or user.level == 1

    def get_fieldsets(self, request, obj=None):
        """
        控制用户表单内容
        """
        if request.user.level == 1:  # 如果是一级用户
            self.form = CustomUserForm  # 使用限制后的表单
        if obj:  # 这部分是编辑用户信息时的设置
            if request.user.is_superuser:
                return super(UserModelAdmin, self).get_fieldsets(request, obj)
            elif request.user.level == 1:
                return (
                    (None, {"fields": ("username",)}),
                    ("Personal info", {"fields": ("name", "level")}),
                )
        else:  # 这部分是创建新用户时的设置
            if request.user.is_superuser:
                return super(UserModelAdmin, self).get_fieldsets(request, obj)
            elif request.user.level == 1:
                return (
                    (None, {"fields": ("username", "password")}),
                    ("Personal info", {"fields": ("name", "level")}),
                )
