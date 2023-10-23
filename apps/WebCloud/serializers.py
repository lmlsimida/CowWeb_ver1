from rest_framework import serializers

from apps.WebCloud.models import HistoryData, Cage, RFID, Feeding, CowCard


class ProductModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistoryData
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CageModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cage
        fields = "__all__"  # 表示序列化数据库中的所有字段


class RFIDModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = RFID
        fields = "__all__"  # 表示序列化数据库中的所有字段


class FeedingModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Feeding
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CowCardModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = CowCard
        fields = "__all__"  # 表示序列化数据库中的所有字段
