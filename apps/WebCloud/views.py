from django.db.models import Count
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response
from rest_framework.viewsets import ReadOnlyModelViewSet, ModelViewSet

from apps.WebCloud import helper
from apps.WebCloud.models import HistoryData, Cage, RFID, FeedingStandard, Calf
from apps.WebCloud.serializers import (
    HistoryDataModelSerializer,
    CageModelSerializer,
    RFIDModelSerializer,
    FeedingStandardModelSerializer,
    CalfModelSerializer,
)
from utils.pagination import TenItemPerPagePagination

LOCATION = helper.area


@csrf_exempt
def choose_province(request):
    province = list(LOCATION.keys())
    return JsonResponse(province, safe=False)


@csrf_exempt
def choose_city(request):
    province = request.GET.get("p")
    if not province:
        cities = []
    else:
        cities = list(LOCATION[province].keys())
    return JsonResponse(cities, safe=False)


@csrf_exempt
def choose_district(request):
    province = request.GET.get("p")
    city = request.GET.get("c")
    if not (province and city):
        districts = []
    else:
        districts = LOCATION[province][city]
    return JsonResponse(districts, safe=False)


class HistoryDataViewSet(ReadOnlyModelViewSet):
    """
    只读历史数据视图集
    """

    queryset = HistoryData.objects.filter(is_delete=False)
    serializer_class = HistoryDataModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["rfid_id", "pasture"]


class CageViewSet(ModelViewSet):
    """
    犊牛笼视图集
    """

    queryset = Cage.objects.all()
    serializer_class = CageModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["pasture"]


class RFIDViewSet(ReadOnlyModelViewSet):
    queryset = RFID.objects.all()
    serializer_class = RFIDModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["rfid_id", "pasture"]
    lookup_field = "rfid_id"

    @action(methods=["GET"], url_path="all-data", detail=True)
    def all_data(self, request, *args, **kwargs):
        """
        获取RFID卡的所有数据
        """
        instance: RFID = self.get_object()
        if not instance.is_bound:
            raise ValidationError("该RFID卡未绑定!")
        cage_data = CageModelSerializer(instance=instance.cage).data  # 犊牛笼数据
        calf_data = CalfModelSerializer(instance=instance.calf).data  # 犊牛数据
        feeding_standard_data = FeedingStandardModelSerializer(
            instance=instance.feeding_standard
        ).data  # 喂养标准数据
        history_data = HistoryDataModelSerializer(
            instance=instance.history_data, many=True
        ).data  # 历史数据

        return Response(
            {
                "cage_data": cage_data,
                "calf_data": calf_data,
                "feeding_standard_data": feeding_standard_data,
                "history_data": history_data,
            }
        )


class FeedingStandardViewSet(ModelViewSet):
    queryset = FeedingStandard.objects.all()
    serializer_class = FeedingStandardModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["pasture"]


class CalfViewSet(ModelViewSet):
    queryset = Calf.objects.all()
    serializer_class = CalfModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["pasture"]

    @action(methods=["GET"], url_path="born-count-per-day", detail=False)
    def born_count_per_day(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        result = (
            queryset.values("date_of_birth")  # 分组依据
            .annotate(birth_count=Count("id"))  # 计算每组的数量
            .order_by("date_of_birth")  # 可选，根据需要排序
        )
        return Response(result)
