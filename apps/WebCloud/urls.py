from rest_framework.routers import DefaultRouter

from apps.WebCloud import views

router = DefaultRouter()
router.register("history", views.ProductViewSet)
router.register("cages", views.CageViewSet)
router.register("rfids", views.RFIDViewSet)
router.register("feedings", views.FeedingViewSet)
router.register("cow-cards", views.CowCardViewSet)
urlpatterns = router.get_urls()
