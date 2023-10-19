from django.contrib import admin

from apps.WebCloud.models import Cage, Cow_Card, RFID, Feeding, HistoryData

# Register your models here.


admin.site.register([Cage, Cow_Card, RFID, Feeding, HistoryData])  # 注册模型
