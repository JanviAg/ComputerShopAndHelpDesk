from django.urls import path
from . import views

urlpatterns = [
    path('', views.index,name='index'),
    path('techlogin/', views.techlogin,name='techlogin'),
    path('techsignup/', views.techsignup,name='techsignup'),    
    path('techforgotpassword/', views.techforgotpassword,name='techforgotpassword'),    
    path('faqAdd/', views.techfaqadd,name='techfaqadd'),
    path('faqView/', views.techfaqview,name='techfaqview'),
    path('ticketView/', views.techticketview,name='techticketview'),
    path('feedbackView/', views.techfeedbackview,name='techfeedbackview'),
    path('tech_mail_otp/',views.tech_mail_otp,name='tech_mail_otp'),
    path('tech_change_password/',views.tech_change_password,name='tech_change_password'),
]
