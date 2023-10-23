from django import forms
from django.contrib import admin

from apps.WebCloud.models import Cage, CowCard, RFID, Feeding, HistoryData, Pasture


# Register your models here.
class CustomModelAdmin(admin.ModelAdmin):
    def has_delete_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level == 1

    def has_add_permission(self, request):
        user = request.user
        return user.is_superuser or user.level < 3

    def has_change_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level < 3

    def get_queryset(self, request):
        user = request.user
        qs = super().get_queryset(request)
        if user.is_superuser:
            return qs
        return qs.filter(pasture=user.pasture)


class PastureForm(forms.ModelForm):
    class Meta:
        widgets = {
            "province": forms.Select(),
            "city": forms.Select(),
            "district": forms.Select(),
        }


@admin.register(Pasture)
class PastureAdmin(admin.ModelAdmin):
    form = PastureForm
    fields = ("name", "province", "city", "district", "address_detail")
    list_display = ("name", "province", "city", "district")
    search_fields = ("name", "province", "city", "district", "address_detail")
    list_filter = ("province", "city", "district")
    list_per_page = 20
    ordering = ["id"]
    change_form_template = "area.html"

    def has_module_permission(self, request):
        return request.user.is_superuser


@admin.register(RFID)
class RFIDAdmin(CustomModelAdmin):
    list_display = ["rfid_id", "use_status"]

    def has_delete_permission(self, request, obj=None):
        return request.user.is_superuser

    def has_add_permission(self, request):
        return request.user.is_superuser

    def has_change_permission(self, request, obj=None):
        return request.user.is_superuser


@admin.register(Cage)
class CageAdmin(CustomModelAdmin):
    list_display = ["cage_id", "area", "area_id", "descr"]


@admin.register(CowCard)
class CowCardAdmin(CustomModelAdmin):
    list_display = [
        "cage_cow",
        "rfid",
        "cow_id",
        "date_of_birth",
        "cage_entry_date",
        "cage_status",
    ]


@admin.register(Feeding)
class FeedingAdmin(CustomModelAdmin):
    list_display = ["feeding_age", "feeding_total_feeding", "feeding_up"]

    def has_delete_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level == 1

    def has_add_permission(self, request):
        user = request.user
        return user.is_superuser or user.level == 1

    def has_change_permission(self, request, obj=None):
        user = request.user
        return user.is_superuser or user.level == 1


@admin.register(HistoryData)
class HistoryDataAdmin(CustomModelAdmin):
    list_display = ["rfid", "cage", "cow", "day_of_birth", "area"]

    def has_module_permission(self, request):
        return request.user.is_superuser
