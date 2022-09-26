from django.urls import path
from . import views

urlpatterns = [
    path('', views.index,name='index'),   
    path('aboutus/', views.aboutus,name='aboutus'),
    path('contactus/', views.contactus,name='contactus'),
    path('login/', views.login,name='login'),
    path('signup/', views.signup,name='signup'),
    path('forgotpassword/', views.forgotpassword,name='forgotpassword'),
    path('myaccount/', views.myaccount,name='myaccount'),
    path('shop/', views.shop,name='shop'),
    path('product/', views.product,name='product'),
    path('build/', views.build,name='build'),
    path('buildselect/', views.buildselect,name='buildselect'),    
    path('cart/', views.cart,name='cart'),
    path('checkout/', views.checkout,name='checkout'),
    path('faq/', views.faq,name='faq'),
    path('ticket/', views.ticket,name='ticket'),
    path('feedback/', views.feedback,name='feedback'),
    path('password_otp/',views.password_otp,name='password_otp'),
    path('changepassword/',views.changepassword,name='changepassword'),
]
