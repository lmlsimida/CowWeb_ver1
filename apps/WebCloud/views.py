from rest_framework.viewsets import ModelViewSet

from apps.WebCloud.models import HistoryData
from apps.WebCloud.serializers import ProductModelSerializer
from utils.pagination import TenItemPerPagePagination


class ProductViewSet(ModelViewSet):
    queryset = HistoryData.objects.filter(is_delete=False).order_by("-c_time")
    serializer_class = ProductModelSerializer
    pagination_class = TenItemPerPagePagination
