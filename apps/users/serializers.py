from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from apps.users.models import User


class UserRegisterSerializer(serializers.ModelSerializer):
    # password_confirm设置 write_only 只有注册的时候需要使用,返回的时候不需要
    password_confirm = serializers.CharField(
        label="确认密码",
        help_text="确认密码",
        write_only=True,
        min_length=6,
        max_length=20,
        error_messages={
            "min_length": "仅允许6-20个字符的密码",
            "max_length": "仅允许6-20个字符的密码",
        },
    )

    class Meta:
        model = User
        fields = (
            "id",
            "username",
            "password",
            "password_confirm",
            "email",
            "mobile",
            "name",
        )
        # model指定的模型中没有的字段，不能在extra_kwargs中定义
        extra_kwargs = {
            "username": {
                "label": "用户名",
                "help_text": "用户名",
                "min_length": 6,
                "max_length": 20,
                "error_messages": {
                    "min_length": "仅允许6-20个字符的用户名",
                    "max_length": "仅允许6-20个字符的用户名",
                },
            },
            "password": {
                "label": "密码",
                "help_text": "密码",
                "min_length": 6,
                "max_length": 20,
                "write_only": True,
                "error_messages": {
                    "min_length": "仅允许6-20个字符的密码",
                    "max_length": "仅允许6-20个字符的密码",
                },
            },
            "email": {
                "label": "邮箱",
                "help_text": "邮箱",
                "required": True,
                "allow_blank": True,
                "validators": [
                    UniqueValidator(queryset=User.objects.all(), message="此邮箱已注册")
                ],
            },
        }

    def validate_password_confirm(self, value):
        """
        校验两次输入的密码是否一致
        :param value:
        :return:
        """
        if value != self.initial_data["password"]:
            raise serializers.ValidationError("两次输入的密码不一致!")
        return value

    def create(self, validated_data):
        validated_data.pop("password_confirm")
        # 注意调用create_user方法来创建用户，会对密码进行加密
        return User.objects.create_user(**validated_data)


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        data["token"] = data.pop("access")
        data["userInfo"] = {
            "userId": self.user.id,
            "userName": self.user.name or "匿名",
            "dashboard": "0",
            "is_superuser": self.user.is_superuser,
            "role": self.user.roles and self.user.roles.split(",") or [],
        }
        return data


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "username",
            "password",
            "mobile",
            "email",
            "is_staff",
            "is_active",
            "is_superuser",
            "name",
            "date_joined",
            "roles",
        ]
        extra_kwargs = {"password": {"write_only": True}}  # 展示的时候不渲染密码

    def create(self, validated_data):
        user = super().create(validated_data)
        # 手动的处理密码
        user.set_password(validated_data["password"])
        user.save()
        return user

    def update(self, instance, validated_data):
        obj = super().update(instance, validated_data)
        # 判断是否有password过来
        password = validated_data.get("password")
        if password is not None:
            obj.set_password(password)
            obj.save()
        return obj
