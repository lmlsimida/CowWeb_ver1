from collections import OrderedDict

from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class TenItemPerPagePagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = "pageSize"
    max_page_size = 5000

    def paginate_queryset(self, queryset, request, view=None):
        # 从请求中获取 'pageSize' 参数
        page_size = request.query_params.get(self.page_size_query_param)
        if page_size:
            try:
                # 尝试将 'pageSize' 转换为整数
                page_size = int(page_size)
                # 确保 'pageSize' 不超过最大页面大小
                if page_size > 0 and page_size <= self.max_page_size:
                    self.page_size = page_size
            except ValueError:
                # 如果转换失败，保持默认的 'page_size'
                pass

        return super().paginate_queryset(queryset, request, view)

    def get_paginated_response(self, data):
        return Response(
            OrderedDict(
                [
                    (
                        "data",
                        OrderedDict(
                            [
                                ("page", self.page.paginator.num_pages),
                                ("pageSize", self.page.paginator.per_page),
                                ("rows", data),
                                ("total", self.page.paginator.count),
                            ]
                        ),
                    ),
                    ("message", ""),
                    ("code", 200),
                    ("next", self.get_next_link()),
                    ("previous", self.get_previous_link()),
                ]
            )
        )
