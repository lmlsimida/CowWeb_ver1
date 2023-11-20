from rest_framework import serializers

from apps.WebCloud.models import (
    HistoryData,
    Cage,
    RFID,
    FeedingStandard,
    Calf,
    CalfCage,
    RemainingMilk,
    RFIDCage,
    DataUpdateStatus,
)


class HistoryDataModelSerializer(serializers.ModelSerializer):
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


class FeedingStandardModelSerializer(serializers.ModelSerializer):
    sex = serializers.SerializerMethodField()

    @staticmethod
    def get_sex(obj):
        """
        展示可读性别
        """
        return obj.get_set_display()

    class Meta:
        model = FeedingStandard
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CalfModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Calf
        fields = "__all__"  # 表示序列化数据库中的所有字段


class RemainingMilkModelSerializer(serializers.ModelSerializer):
    rfid = serializers.SlugRelatedField(
        queryset=RFID.objects.all(), slug_field="rfid_id"  # 使用rfid_id做关联字段
    )

    class Meta:
        model = RemainingMilk
        fields = "__all__"  # 表示序列化数据库中的所有字段


class RFIDCageModelSerializer(serializers.ModelSerializer):
    rfid = serializers.SlugRelatedField(
        queryset=RFID.objects.all(), slug_field="rfid_id"  # 使用rfid_id做关联字段
    )
    cage = serializers.SlugRelatedField(
        queryset=Cage.objects.all(), slug_field="cage_id"  # 使用cage_id做关联字段
    )

    class Meta:
        model = RFIDCage
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CalfCageModelSerializer(serializers.ModelSerializer):
    calf = serializers.SlugRelatedField(
        queryset=Calf.objects.all(), slug_field="calf_id"  # 使用calf_id做关联字段
    )
    cage = serializers.SlugRelatedField(
        queryset=Cage.objects.all(), slug_field="cage_id"  # 使用cage_id做关联字段
    )

    class Meta:
        model = CalfCage
        fields = "__all__"  # 表示序列化数据库中的所有字段


class DataUpdateStatusModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = DataUpdateStatus
        fields = "__all__"  # 表示序列化数据库中的所有字段
