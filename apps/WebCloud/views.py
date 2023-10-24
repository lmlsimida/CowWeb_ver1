from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.viewsets import ReadOnlyModelViewSet, ModelViewSet

from apps.WebCloud import helper
from apps.WebCloud.models import HistoryData, Cage, RFID, FeedingStandard, Calf
from apps.WebCloud.serializers import (
    ProductModelSerializer,
    CageModelSerializer,
    RFIDModelSerializer,
    FeedingStandardModelSerializer,
    CalfModelSerializer,
)
from utils.pagination import TenItemPerPagePagination

LOCATION = helper.area


class ProductViewSet(ReadOnlyModelViewSet):
    """
    只读历史数据视图集
    """

    queryset = HistoryData.objects.filter(is_delete=False)
    serializer_class = ProductModelSerializer
    pagination_class = TenItemPerPagePagination


class CageViewSet(ModelViewSet):
    queryset = Cage.objects.all()
    serializer_class = CageModelSerializer
    pagination_class = TenItemPerPagePagination


class RFIDViewSet(ReadOnlyModelViewSet):
    queryset = RFID.objects.all()
    serializer_class = RFIDModelSerializer
    pagination_class = TenItemPerPagePagination


class FeedingStandardViewSet(ModelViewSet):
    queryset = FeedingStandard.objects.all()
    serializer_class = FeedingStandardModelSerializer
    pagination_class = TenItemPerPagePagination


class CalfViewSet(ModelViewSet):
    queryset = Calf.objects.all()
    serializer_class = CalfModelSerializer
    pagination_class = TenItemPerPagePagination


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
