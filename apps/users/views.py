# Create your views here.
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from rest_framework_simplejwt.views import TokenObtainPairView

from apps.users.models import User
from apps.users.serializers import UserRegisterSerializer, MyTokenObtainPairSerializer, UserSerializer
from utils.pagination import TenItemPerPagePagination


class UserRegisterView(generics.CreateAPIView):
    serializer_class = UserRegisterSerializer


class LoginView(TokenObtainPairView):
    """
    登录视图
    """
    serializer_class = MyTokenObtainPairSerializer


class UserViewSet(ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all().order_by('-date_joined')  # 按创建时间倒序
    permission_classes = [IsAuthenticated]
    pagination_class = TenItemPerPagePagination

