from django.urls import path
from accounts import views

urlpatterns = [
    path('',views.home,name='home'),
    path('logout',views.logoutuser,name='logout'),
    path('register',views.register,name='register'),
    path('login', views.login, name='login'),
]
