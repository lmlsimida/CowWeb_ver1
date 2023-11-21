from django import forms
from django.contrib import admin
from django.contrib.auth.models import AnonymousUser

from apps.WebCloud.models import (
    Cage,
    RFID,
    HistoryData,
    Pasture,
    Calf,
    FeedingStandard,
    RFIDCage,
    CalfCage,
    UnlinkCalf,
)


class CustomModelAdmin(admin.ModelAdmin):
    """
    自定义admin基类
    """

    def has_view_permission(self, request, obj=None):
        return True

    def has_delete_permission(self, request, obj=None):
        """
        只有管理员或一级用户有删除权限
        """
        user = request.user
        return user.is_superuser or user.level == 1

    def has_add_permission(self, request):
        """
        只有管理员或等级小于3的用户有新增权限
        """
        user = request.user
        return user.is_superuser or user.level < 3

    def has_change_permission(self, request, obj=None):
        """
        只有管理员或等级小于3的用户有修改权限
        """
        user = request.user
        return user.is_superuser or user.level < 3

    def get_queryset(self, request):
        """
        控制普通用户只能看到自己牧场的数据
        """
        user = request.user
        qs = super().get_queryset(request)
        if user.is_superuser:
            return qs
        return qs.filter(pasture=user.pasture)

    def has_module_permission(self, request):
        user = request.user
        if isinstance(user, AnonymousUser):
            return False
        if user.is_superuser or user.level in [1, 2, 3]:
            return True
        return False  # 其他级别的用户不能管理此模型


class PastureForm(forms.ModelForm):
    """
    牧场表单
    """

    class Meta:
        widgets = {
            "province": forms.Select(),
            "city": forms.Select(),
            "district": forms.Select(),
        }


@admin.register(Pasture)
class PastureAdmin(admin.ModelAdmin):
    """
    自定义牧场admin
    """

    form = PastureForm
    fields = ("name", "province", "city", "district", "address_detail")
    list_display = ("name", "province", "city", "district")
    search_fields = ("name", "province", "city", "district", "address_detail")
    list_filter = ("province", "city", "district")
    list_per_page = 20
    ordering = ["id"]
    change_form_template = "area.html"  # 使用自定义模板页面

    def has_module_permission(self, request):
        """
        只有管理员可以管理牧场
        """
        return request.user.is_superuser


@admin.register(RFID)
class RFIDAdmin(CustomModelAdmin):
    """
    RFID 自定义admin
    """

    list_display = ["rfid_id"]  # 列表展示项

    def has_delete_permission(self, request, obj=None):
        """
        只有管理员可以删
        """
        return request.user.is_superuser

    def has_add_permission(self, request):
        """
        只有管理员可以增加
        """
        return request.user.is_superuser

    def has_change_permission(self, request, obj=None):
        """
        只有管理员可以修改
        """
        return request.user.is_superuser


@admin.register(Cage)
class CageAdmin(CustomModelAdmin):
    """
    Cage 自定义admin
    """

    list_display = ["cage_id", "area", "area_id", "descr"]  # 列表展示项


@admin.register(Calf)
class CalfAdmin(CustomModelAdmin):
    """
    CowCardAdmin 自定义admin
    """

    list_display = ["calf_id", "date_of_birth"]  # 列表展示项


@admin.register(UnlinkCalf)
class UnlinkCalfAdmin(CustomModelAdmin):
    """
    UnlinkCalfAdmin 自定义admin
    """

    list_display = [
        "calf_id",
        "date_of_birth",
        "sex",
        "birth_weight",
        "weight_unlink",
        "date_unlink",
        "pasture",
    ]  # 列表展示项


@admin.register(FeedingStandard)
class FeedingStandardAdmin(CustomModelAdmin):
    """
    Feeding 自定义admin
    """

    list_display = ["feeding_age", "feeding_total_feeding", "feeding_up"]  # 列表展示项

    def has_delete_permission(self, request, obj=None):
        """
        二级用户和二级用户以上不可删
        """
        user = request.user
        return user.is_superuser or user.level == 1

    def has_add_permission(self, request):
        """
        二级用户和二级用户以上不可增
        """
        user = request.user
        return user.is_superuser or user.level == 1

    def has_change_permission(self, request, obj=None):
        """
        二级用户和二级用户以上不可改
        """
        user = request.user
        return user.is_superuser or user.level == 1


@admin.register(HistoryData)
class HistoryDataAdmin(CustomModelAdmin):
    """
    历史数据 自定义 admin
    """

    list_display = ["rfid_id", "cage_id", "calf_id", "day_of_birth", "area"]  # 列表展示项

    def has_module_permission(self, request):
        """
        只有管理员可以管理
        """
        return request.user.is_superuser


@admin.register(RFIDCage)
class RFIDCageAdmin(CustomModelAdmin):
    """
    RFID & Cage自定义 admin
    """

    list_display = ["rfid", "cage"]  # 列表展示项

    def has_module_permission(self, request):
        """
        只有管理员可以管理
        """
        return request.user.is_superuser


@admin.register(CalfCage)
class CalfCageAdmin(CustomModelAdmin):
    """
    Calf & age自定义 admin
    """

    list_display = ["cage", "calf"]  # 列表展示项

    def has_module_permission(self, request):
        """
        只有管理员可以管理
        """
        return request.user.is_superuser
