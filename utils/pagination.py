from collections import OrderedDict

from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class TenItemPerPagePagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = "pageSize"
    max_page_size = 100

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
