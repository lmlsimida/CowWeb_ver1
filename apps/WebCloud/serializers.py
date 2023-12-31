from rest_framework import serializers

from apps.WebCloud.models import (
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
    AutoHistoryData,
    RationHistoryData,
)


class AutoHistoryDataModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = AutoHistoryData
        fields = "__all__"  # 表示序列化数据库中的所有字段


class RationHistoryDataModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = RationHistoryData
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CageModelSerializer(serializers.ModelSerializer):
    has_bound2calf = serializers.SerializerMethodField(label="是否绑定犊牛")
    has_bound2rfid = serializers.SerializerMethodField(label="是否绑定RFID")
    bound2calf_time = serializers.SerializerMethodField(label="绑定犊牛时间")
    bound2rfid_time = serializers.SerializerMethodField(label="绑定RFID时间")

    @staticmethod
    def get_has_bound2calf(obj):
        return obj.has_calf()

    @staticmethod
    def get_has_bound2rfid(obj):
        return obj.is_bound

    @staticmethod
    def get_bound2rfid_time(obj):
        return obj.bound_time if obj.is_bound else None

    @staticmethod
    def get_bound2calf_time(obj):
        return obj.has_calf_time if obj.has_calf() else None

    class Meta:
        model = Cage
        fields = "__all__"  # 表示序列化数据库中的所有字段


class RFIDModelSerializer(serializers.ModelSerializer):
    is_bound = serializers.SerializerMethodField(label="是否绑定")

    def get_is_bound(self, obj):
        return obj.is_bound

    class Meta:
        model = RFID
        fields = "__all__"  # 表示序列化数据库中的所有字段


class FeedingStandardModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = FeedingStandard
        fields = "__all__"  # 表示序列化数据库中的所有字段


class CalfModelSerializer(serializers.ModelSerializer):
    sex = serializers.SerializerMethodField(label="性别")
    has_bound = serializers.SerializerMethodField(label="是否入笼")
    bound_time = serializers.SerializerMethodField(label="入笼时间")

    @staticmethod
    def get_sex(obj):
        """
        展示可读性别
        """
        return obj.get_sex_display()

    @staticmethod
    def get_has_bound(obj):
        return obj.is_in_cage

    @staticmethod
    def get_bound_time(obj):
        return obj.in_cage_time if obj.is_in_cage else None

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


class DeviceLogModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = DeviceLog
        fields = "__all__"  # 表示序列化数据库中的所有字段


class PastureModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = Pasture
        fields = "__all__"


class UnlinkCalfModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = UnlinkCalf
        fields = "__all__"
