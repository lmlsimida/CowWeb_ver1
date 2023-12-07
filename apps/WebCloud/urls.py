from rest_framework.routers import DefaultRouter

from apps.WebCloud import views

router = DefaultRouter()
router.register("auto-history", views.AutoHistoryDataViewSet)
router.register("ration-history", views.RationHistoryDataViewSet)
router.register("cages", views.CageViewSet)
router.register("rfids", views.RFIDViewSet)
router.register("feeding-standards", views.FeedingStandardViewSet)
router.register("calves", views.CalfViewSet)
router.register("remaining-milks", views.RemainingMilkViewSet)
router.register("rfid-cages", views.RFIDCageViewSet)
router.register("calf-cages", views.CalfCageViewSet)
router.register("data-update-status", views.DataUpdateStatusViewSet)
router.register("device-logs", views.DeviceLogViewSet)
router.register("pastures", views.PastureViewSet)
router.register("unlink-calves", views.UnlinkCalfViewSet)
urlpatterns = router.get_urls()
