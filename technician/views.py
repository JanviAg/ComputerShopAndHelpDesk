from django.shortcuts import render
from django.http import HttpResponse
from administrator import urls

from django.core.mail import send_mail
from django.conf import settings

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='computer_shop')
print('Successfully connected to database')
cur = conn.cursor()

# Create your views here.

def index(request):
    return render(request,'technician/index.html')

def techlogin(request):
    return render(request,'technician/techlogin.html')

def techsignup(request):
    return render(request,'technician/techsignup.html')

def techforgotpassword(request):
    return render(request,'technician/techforgotpassword.html')

def techfaqadd(request):
    return render(request,'technician/techfaqadd.html')

def techfaqview(request):
    cur.execute("SELECT tbl_faq_mst.faq_id,  tbl_user_mst.user_name,  tbl_faq_mst.faq_question,  tbl_faq_mst.faq_answer FROM tbl_faq_mst  INNER JOIN tbl_user_mst ON tbl_user_mst.user_id = tbl_faq_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'technician/techfaqview.html', {'faq': data}) 

def techticketview(request):
    return render(request,'technician/techticketview.html')

def techfeedbackview(request):
    return render(request,'technician/techfeedbackview.html')

# def techfeedbackview(request):
#     cur.execute("SELECT tbl_feedback_mst.feedback_id,  tbl_user_mst.user_name,  tbl_feedback_mst.feedback_rating,  tbl_feedback_mst.feedback_desc FROM tbl_feedback_mst  INNER JOIN tbl_user_mst ON tbl_user_mst.user_id = tbl_feedback_mst.user_id")
#     data = cur.fetchall()
#     #return list(data)
#     print(list(data))
#     return render(request,'technician/techfeedbackview.html', {'feedback': data}) 

def tech_mail_otp(request):
    return render(request,'technician/tech_mail_otp.html')

def tech_change_password(request):
    return render(request,'technician/tech_change_password.html')