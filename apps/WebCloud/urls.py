from django.urls import path, include
from rest_framework.routers import DefaultRouter

from apps.WebCloud import views

router = DefaultRouter()
router.register("history", views.ProductViewSet)
urlpatterns = [path("", include(router.urls))]
