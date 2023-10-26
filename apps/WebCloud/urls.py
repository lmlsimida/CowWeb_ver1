from rest_framework.routers import DefaultRouter

from apps.WebCloud import views

router = DefaultRouter()
router.register("history", views.HistoryDataViewSet)
router.register("cages", views.CageViewSet)
router.register("rfids", views.RFIDViewSet)
router.register("feeding-standards", views.FeedingStandardViewSet)
router.register("calves", views.CalfViewSet)
urlpatterns = router.get_urls()
