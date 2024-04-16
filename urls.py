from django.contrib import admin
from django.urls import path, include    # Import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('hospital.urls')),  # Include the URLs of your 'hospital' app
]
