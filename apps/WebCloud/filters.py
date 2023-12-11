import django_filters

from apps.WebCloud.models import Calf, Cage, RFID


class CalfFilter(django_filters.FilterSet):
    has_bound = django_filters.BooleanFilter(method="filter_has_bound")

    class Meta:
        model = Calf
        fields = ["pasture", "date_of_birth", "has_bound"]

    def filter_has_bound(self, queryset, name, value):
        if value:
            return queryset.filter(calf_cage__isnull=False)
        else:
            return queryset.filter(calf_cage__isnull=True)


class CageFilter(django_filters.FilterSet):
    has_bound2calf = django_filters.BooleanFilter(method="filter_has_bound2calf")
    has_bound2rfid = django_filters.BooleanFilter(method="filter_bound2rfid")

    class Meta:
        model = Cage
        fields = ["pasture", "has_bound2calf", "has_bound2rfid"]

    def filter_has_bound2calf(self, queryset, name, value):
        if value:
            return queryset.filter(calf_cage__isnull=False)
        else:
            return queryset.filter(calf_cage__isnull=True)

    def filter_bound2rfid(self, queryset, name, value):
        if value:
            return queryset.filter(rfid_cage__isnull=False)
        else:
            return queryset.filter(rfid_cage__isnull=True)


class RFIDFilter(django_filters.FilterSet):
    is_bound = django_filters.BooleanFilter(method="filter_is_bound")

    class Meta:
        model = RFID
        fields = ["pasture", "rfid_id", "is_bound"]

    def filter_is_bound(self, queryset, name, value):
        if value:
            return queryset.filter(rfid_cage__isnull=False)
        else:
            return queryset.filter(rfid_cage__isnull=True)
