from datetime import date, datetime

from django.db.models import Count, QuerySet
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.exceptions import APIException, ValidationError
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ReadOnlyModelViewSet, ModelViewSet

from apps.WebCloud import helper
from apps.WebCloud.filters import CalfFilter, CageFilter, RFIDFilter
from apps.WebCloud.models import (
    AutoHistoryData,
    Cage,
    RFID,
    FeedingStandard,
    Calf,
    CalfCage,
    RemainingMilk,
    RFIDCage,
    DataUpdateStatus,
    DeviceLog,
    Pasture,
    UnlinkCalf,
    RationHistoryData,
)
from apps.WebCloud.serializers import (
    CageModelSerializer,
    RFIDModelSerializer,
    FeedingStandardModelSerializer,
    CalfModelSerializer,
    RemainingMilkModelSerializer,
    RFIDCageModelSerializer,
    CalfCageModelSerializer,
    DataUpdateStatusModelSerializer,
    DeviceLogModelSerializer,
    PastureModelSerializer,
    UnlinkCalfModelSerializer,
    AutoHistoryDataModelSerializer,
    RationHistoryDataModelSerializer,
)
from utils.pagination import TenItemPerPagePagination

LOCATION = helper.area


class CustomException(APIException):
    status_code = 200
    default_detail = "错误"
    default_code = "400"


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


class AutoHistoryDataViewSet(ModelViewSet):
    """
    auto历史数据视图集
    """

    queryset = AutoHistoryData.objects.all()
    serializer_class = AutoHistoryDataModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["rfid_id", "pasture"]  # 筛选选项
    permission_classes = []

    def create(self, request, *args, **kwargs):
        """
        新建，传递列表可批量创建
        """
        data = request.data
        if isinstance(data, list):
            serializer = self.get_serializer(data=data, many=True)
        else:
            serializer = self.get_serializer(data=data)

        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(None, status=status.HTTP_201_CREATED, headers=headers)


class RationHistoryDataViewSet(ModelViewSet):
    """
    ration历史数据视图集
    """

    queryset = RationHistoryData.objects.all()
    serializer_class = RationHistoryDataModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["rfid_id", "pasture"]  # 筛选选项
    permission_classes = []

    def create(self, request, *args, **kwargs):
        """
        新建，传递列表可批量创建
        """
        data = request.data
        if isinstance(data, list):
            serializer = self.get_serializer(data=data, many=True)
        else:
            serializer = self.get_serializer(data=data)

        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(None, status=status.HTTP_201_CREATED, headers=headers)


class CageViewSet(ModelViewSet):
    """
    犊牛笼视图集
    """

    queryset = Cage.objects.all()
    serializer_class = CageModelSerializer
    pagination_class = TenItemPerPagePagination
    # filterset_fields = ["pasture"]  # 筛选选项
    filter_backends = [DjangoFilterBackend]
    filterset_class = CageFilter
    lookup_field = "cage_id"

    @action(methods=["GET"], url_path="all-data", detail=True)
    def all_data(self, request, *args, **kwargs):
        """
        获取犊牛的所有数据
        """
        instance: Cage = self.get_object()
        calf_data = None
        rfid_data = None
        feeding_standard_data = None
        cage_data = self.serializer_class(instance=instance).data
        if instance.has_calf():
            calf_data = CalfModelSerializer(instance=instance.calf).data  # 犊牛数据
        if instance.is_bound:
            rfid_data = RFIDModelSerializer(instance=instance.rfid).data  # RFID数据
        try:
            feeding_standard_data = FeedingStandardModelSerializer(
                instance=instance.feeding_standard
            ).data  # 喂养标准数据
        except Exception:
            pass

        return Response([rfid_data, cage_data, calf_data, feeding_standard_data])


class RFIDViewSet(ReadOnlyModelViewSet):
    queryset = RFID.objects.all()
    serializer_class = RFIDModelSerializer
    pagination_class = TenItemPerPagePagination
    # filterset_fields = ["rfid_id", "pasture"]  # 筛选选项
    filter_backends = [DjangoFilterBackend]
    filterset_class = RFIDFilter
    lookup_field = "rfid_id"

    @action(methods=["GET"], url_path="all-data", detail=True)
    def all_data(self, request, *args, **kwargs):
        """
        获取RFID卡的所有数据
        """
        instance: RFID = self.get_object()
        cage_data = None
        calf_data = None
        feeding_standard_data = None
        rfid_data = self.serializer_class(instance=instance).data
        if instance.is_bound:
            cage_data = CageModelSerializer(instance=instance.cage).data  # 犊牛笼数据
            if instance.cage.has_calf():
                calf_data = CalfModelSerializer(instance=instance.calf).data  # 犊牛数据
        try:
            feeding_standard_data = FeedingStandardModelSerializer(
                instance=instance.feeding_standard
            ).data  # 喂养标准数据
        except Exception:
            pass

        return Response([rfid_data, cage_data, calf_data, feeding_standard_data])

    @action(methods=["GET"], url_path="unbind", detail=True)
    def unbind(self, *args, **kwargs):
        instance: RFID = self.get_object()
        if not instance.is_bound:
            raise ValidationError("该rfid未绑定")
        instance.unbind()
        return Response(None)


class FeedingStandardViewSet(ModelViewSet):
    queryset = FeedingStandard.objects.all()
    serializer_class = FeedingStandardModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["pasture"]  # 筛选选项


class CalfViewSet(ModelViewSet):
    queryset = Calf.objects.all()
    serializer_class = CalfModelSerializer
    pagination_class = TenItemPerPagePagination
    # filterset_fields = ["pasture", "date_of_birth"]  # 筛选选项
    filter_backends = [DjangoFilterBackend]
    filterset_class = CalfFilter
    permission_classes = [IsAuthenticated]
    lookup_field = "calf_id"

    def get_current_pasture_queryset(self) -> QuerySet:
        """
        获取当前用户所在牧场的数据
        """
        return self.queryset.filter(pasture=self.request.user.pasture)

    @action(methods=["GET"], url_path="all-data", detail=True)
    def all_data(self, request, *args, **kwargs):
        """
        获取犊牛的所有数据
        """
        instance: Calf = self.get_object()
        calf_data = None
        cage_data = None
        rfid_data = None
        feeding_standard_data = None
        calf_data = self.serializer_class(instance=instance).data
        if instance.is_in_cage:
            cage_data = CageModelSerializer(instance=instance.cage).data  # 犊牛笼数据
            if instance.cage.is_bound:
                rfid_data = RFIDModelSerializer(instance=instance.rfid).data  # RFID数据
        try:
            feeding_standard_data = FeedingStandardModelSerializer(
                instance=instance.feeding_standard
            ).data  # 喂养标准数据
        except Exception:
            pass

        return Response([rfid_data, cage_data, calf_data, feeding_standard_data])

    @action(methods=["GET"], url_path="born-count", detail=False)
    def born_count(self, request, *args, **kwargs):
        """
        每日出生量
        """
        queryset = self.filter_queryset(self.get_queryset())
        result = (
            queryset.values("date_of_birth")  # 分组依据
            .annotate(birth_count=Count("id"))  # 计算每组的数量
            .order_by("date_of_birth")  # 可选，根据需要排序
        )
        return Response({"data": result})

    @action(methods=["GET"], url_path="feeding-count", detail=False)
    def feeding_count(self, request, *args, **kwargs):
        """
        总饲喂量
        """
        queryset = self.filter_queryset(self.get_queryset())
        result = (
            queryset.values("date_of_birth")  # 分组依据
            .annotate(birth_count=Count("id"))  # 计算每组的数量
            .order_by("date_of_birth")  # 可选，根据需要排序
        )
        for i in result:
            feeding_standard: FeedingStandard = FeedingStandard.objects.filter(
                feeding_age=(date.today() - i["date_of_birth"]).days
            ).first()
            if feeding_standard:
                i["feeding_count"] = feeding_standard.feeding_total_feeding * i.pop(
                    "birth_count"
                )
                i["date"] = feeding_standard.get_feeding_date(i.pop("date_of_birth"))

        return Response({"data": result})

    @staticmethod
    def get_today_feeding_count(queryset) -> int:
        """
        获取今日总饲喂量
        """
        result = (
            queryset.values("date_of_birth")  # 分组依据
            .annotate(birth_count=Count("id"))  # 计算每组的数量
            .order_by("date_of_birth")  # 可选，根据需要排序
        )
        count = 0
        for i in result:
            feeding_standard: FeedingStandard = FeedingStandard.objects.filter(
                feeding_age=(date.today() - i["date_of_birth"]).days
            ).first()
            if feeding_standard:
                if datetime.today() == feeding_standard.get_feeding_date(
                    i.pop("date_of_birth")
                ):
                    count += feeding_standard.feeding_total_feeding * i.pop(
                        "birth_count"
                    )
        return count

    @action(methods=["GET"], url_path="in-cage-count", detail=False)
    def in_cage_count(self, request, *args, **kwargs):
        """
        当前在笼中的牛公母数
        """
        queryset = self.filter_queryset(self.get_queryset())
        # 分组并计算数量
        result = (
            CalfCage.objects.filter(calf__in=queryset)
            .values("calf__sex")
            .annotate(total_count=Count("calf"))
        )
        return Response({"data": result})

    @action(methods=["GET"], url_path="summary", detail=False)
    def summary(self, request, *args, **kwargs):
        """
        当前用户所在牧场的犊牛相关汇总信息
        """
        data_sub = [{
            "id": 1,
            "name": "1类",
            "data": [{"id": "1", "alias": "设备1", "val": "100"}],
        }]
        calf_count_query_data = (
            CalfCage.objects.filter(calf__pasture=request.user.pasture)
            .values("calf__sex")
            .annotate(total=Count("calf"))
            .order_by("calf__sex")
        )
        current_pasture_queryset = self.get_current_pasture_queryset()
        # 初始化变量
        male_count = 0
        female_count = 0

        # 遍历查询结果，将公牛和母牛的数量分别存到不同的变量中
        for item in calf_count_query_data:
            if item["calf__sex"] == 1:  # 公牛
                male_count = item["total"]
            elif item["calf__sex"] == 2:  # 母牛
                female_count = item["total"]
        milk = self.get_today_feeding_count(current_pasture_queryset)
        data_gain = {
            "total": male_count + male_count,
            "totalM": male_count,
            "totalF": female_count,
            "totalH": 0,
            "born": current_pasture_queryset.filter(
                date_of_birth=datetime.today()
            ).count(),
            "milk": milk,
        }
        data = {
            "status": "200",
            "authority": request.user.level,
            "htime": str(datetime.today()),
            "result": {
                "data": {
                    "dataSub": data_sub,
                    "dataGain": data_gain,
                    "dataAlarm": {"alarm": 0},
                }
            },
        }

        return Response(data)


class RemainingMilkViewSet(ModelViewSet):
    """
    剩余奶量视图集
    """

    queryset = RemainingMilk.objects.all()
    serializer_class = RemainingMilkModelSerializer
    pagination_class = TenItemPerPagePagination
    filterset_fields = ["pasture"]  # 筛选选项

    def create(self, request, *args, **kwargs):
        """
        新建，传递列表可批量创建
        """
        data = request.data
        if isinstance(data, list):
            serializer = self.get_serializer(data=data, many=True)
        else:
            serializer = self.get_serializer(data=data)

        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(None, status=status.HTTP_201_CREATED, headers=headers)


class RFIDCageViewSet(ModelViewSet):
    """
    RFID&笼绑定关系视图
    """

    queryset = RFIDCage.objects.all()
    serializer_class = RFIDCageModelSerializer
    pagination_class = TenItemPerPagePagination


class CalfCageViewSet(ModelViewSet):
    """
    犊牛&笼绑定关系视图
    """

    queryset = CalfCage.objects.all()
    serializer_class = CalfCageModelSerializer
    pagination_class = TenItemPerPagePagination

    @action(methods=["POST"], url_path="exchange-cage", detail=False)
    def exchange_cage(self, request, *args, **kwargs):
        data = request.data
        calf_cage1 = self.queryset.filter(
            cage_id=data["cage1"], cage__pasture_id=data["pasture"]
        ).first()
        calf = calf_cage1.calf
        cage_entry_time = calf_cage1.cage_entry_time
        calf_cage1.delete()
        CalfCage.objects.create(
            cage=Cage.objects.filter(id=data["cage2"]).first(),
            calf=calf,
            cage_entry_time=cage_entry_time,
        )
        return Response()


class DataUpdateStatusViewSet(ModelViewSet):
    """
    数据更新状态视图
    """

    queryset = DataUpdateStatus.objects.all()
    serializer_class = DataUpdateStatusModelSerializer
    pagination_class = TenItemPerPagePagination
    lookup_field = "pasture"
    permission_classes = []


class DeviceLogViewSet(ModelViewSet):
    """
    设备日志视图
    """

    queryset = DeviceLog.objects.all()
    serializer_class = DeviceLogModelSerializer
    pagination_class = TenItemPerPagePagination
    permission_classes = []


class UnlinkCalfViewSet(ModelViewSet):
    """
    出笼犊牛视图
    """

    queryset = UnlinkCalf.objects.all()
    serializer_class = UnlinkCalfModelSerializer
    pagination_class = TenItemPerPagePagination
    lookup_field = "pasture"

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        Calf.objects.get(calf_id=serializer.data["calf_id"]).delete()
        return Response(serializer.data)


class PastureViewSet(ModelViewSet):
    """
    牧场视图
    """

    queryset = Pasture.objects.all()
    serializer_class = PastureModelSerializer
    pagination_class = TenItemPerPagePagination
    permission_classes = []

    @action(methods=["GET"], url_path="all-data", detail=True)
    def all_data(self, request, *args, **kwargs):
        """
        获取某牧场入笼犊牛的所有数据
        """
        instance: Pasture = self.get_object()
        calf_cages = CalfCage.objects.filter(calf__pasture=instance).all()
        result = []
        for calf_cage in calf_cages:
            calf = calf_cage.calf
            cage = calf.cage
            if not cage.is_bound:
                continue
            result.append([
                RFIDModelSerializer(instance=calf.rfid).data,
                CageModelSerializer(instance=cage).data,
                CalfModelSerializer(instance=calf).data,
                FeedingStandardModelSerializer(instance=calf.feeding_standard).data,
            ])

        return Response(result)

    @action(methods=["GET"], url_path="data4local", detail=True)
    def data4local(self, request, *args, **kwargs):
        """
        获取某牧场入笼犊牛的所有数据
        """
        instance: Pasture = self.get_object()
        calf_cages = CalfCage.objects.filter(calf__pasture=instance).all()
        result = []
        for calf_cage in calf_cages:
            calf = calf_cage.calf
            cage = calf.cage
            if not cage.is_bound:
                continue
            rfid_data = RFIDModelSerializer(instance=calf.rfid).data
            cage_data = CageModelSerializer(instance=cage).data
            calf_data = CalfModelSerializer(instance=calf).data
            feeding_standard_data = FeedingStandardModelSerializer(
                instance=calf.feeding_standard
            ).data
            result.append({
                "rfid_id": rfid_data["rfid_id"],
                "cage_id": cage_data["cage_id"],
                "area": cage_data["area"],
                "area_id": cage_data["area_id"],
                "sex": calf_data["sex"],
                "has_bound": calf_data["has_bound"],
                "bound_time": calf_data["bound_time"],
                "calf_id": calf_data["calf_id"],
                "date_of_birth": calf_data["date_of_birth"],
                "weight_day_add": calf_data["weight_day_add"],
                "birth_weight": calf_data["birth_weight"],
                "adjusted_feeding": calf_data["adjusted_feeding"],
                "descr": calf_data["descr"],
                "feeding_age": feeding_standard_data["feeding_age"],
                "feeding_total_feeding": feeding_standard_data["feeding_total_feeding"],
                "feeding_up": feeding_standard_data["feeding_up"],
                "pasture": instance.id,
                "bound2calf_time": cage_data["bound2calf_time"],
                "bound2rfid_time": cage_data["bound2rfid_time"],
            })

        return Response(result)
