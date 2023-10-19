from django.urls import path, include
from rest_framework.routers import DefaultRouter

from apps.users import views

router = DefaultRouter()
router.register("", views.UserViewSet)

urlpatterns = [
    path("register/", views.UserRegisterView.as_view(), name="register"),  # 新建用户路由
    path("login/", views.LoginView.as_view(), name="login"),  # 登录用户
    path("", include(router.urls)),  # 获取用户数据
]


# http://127.0.0.1:8000/users/register/ 注册用户
# http://127.0.0.1:8000/users/login/ 登录
# http://127.0.0.1:8000/users/ GET（携带登录返回的token） 请求所有的用户列表
# http://127.0.0.1:8000/users/ POST (USER PASSWORD MOBLE NAME) 新建用户
# http://127.0.0.1:8000/users/ID/ PATVH 修改用户信息
# http://127.0.0.1:8000/users/ID/ DELETE 删除用户信息
