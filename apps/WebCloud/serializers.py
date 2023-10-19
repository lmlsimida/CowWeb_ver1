from rest_framework import serializers

from apps.WebCloud.models import HistoryData, Cage


class ProductModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistoryData
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CageModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cage
        fields = "__all__"  # 表示序列化数据库中的所有字段
