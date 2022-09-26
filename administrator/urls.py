from django.urls import path
from . import views

urlpatterns = [
    path('', views.index,name='index'),  
    path('adminlogin/', views.adminlogin,name='adminlogin'),  
    path('adminlogout/', views.adminlogout,name='adminlogout'),  
    path('adminforgotpassword/', views.adminforgotpassword,name='adminforgotpassword'), 
    path('usercustview/', views.usercustview,name='usercustview'),  
    path('usercustview/', views.usercustview,name='usercustview'),  
    path('usercustview/', views.usercustview,name='usercustview'),
    path('usertechview/', views.usertechview,name='usertechview'),
    path('usertechpending/', views.usertechpending,name='usertechpending'),

    path('brandview/', views.brandview,name='brandview'),
    path('brandadd/', views.brandadd,name='brandadd'),
    path('brandadd/brandinsert/',views.brandaddprocess,name='brandaddprocess'),
    path('brandview/branddelete/<int:id>',views.branddelete,name='branddelete'),
    path('brandview/brandedit/<int:id>',views.brandedit,name='brandedit'),
    path('brandview/brandedit/brandupdate/',views.brandupdate,name='brandupdate'),

    path('categoryadd/', views.categoryadd,name='categoryadd'),
    path('categoryadd/categoryinsert/',views.categoryaddprocess,name='categoryaddprocess'),
    path('categoryview/categorydelete/<int:id>',views.categorydelete,name='categorydelete'),
    path('categoryview/', views.categoryview,name='categoryview'),
    path('categoryview/categoryedit/<int:id>',views.categoryedit,name='categoryedit'),
    path('categoryview/categoryedit/categoryupdate/',views.categoryupdate,name='categoryupdate'),

    path('productadd/', views.productadd,name='productadd'),
    path('productadd/productinsert/',views.productaddprocess,name='productaddprocess'),
    path('productview/', views.productview,name='productview'),
    path('productview/productdelete/<int:id>',views.productdelete,name='productdelete'),
    path('productview/productedit/<int:id>',views.productedit,name='productedit'),
    path('productview/productedit/productupdate/',views.productupdate,name='productupdate'),

    path('orderview/', views.orderview,name='orderview'),
    path('orderitem/', views.orderitem,name='orderitem'),
    path('paymentview/', views.paymentview,name='paymentview'),

    # path('faqadd/', views.faqadd,name='faqadd'),
    # path('faqview/', views.faqview,name='faqview'),
    path('faqadd/', views.faqadd,name='faqadd'),
    path('faqadd/faqinsert/',views.faqaddprocess,name='faqaddprocess'),
    path('faqview/', views.faqview,name='faqview'),
    path('faqview/faqdelete/<int:id>',views.faqdelete,name='faqdelete'),
    path('faqview/faqedit/<int:id>',views.faqedit,name='faqedit'),
    path('faqview/faqedit/faqupdate/',views.faqupdate,name='faqupdate'),



    path('ticketview/', views.ticketview,name='ticketview'),
    
    path('feedbackview/', views.feedbackview,name='feedbackview'),
    path('feedbackview/feedbackdelete/<int:id>',views.feedbackdelete,name='feedbackdelete'),

    path('password_mail_otp/',views.password_mail_otp,name='password_mail_otp'),
    path('adminchangepassword/',views.adminchangepassword,name='adminchangepassword'),
]
