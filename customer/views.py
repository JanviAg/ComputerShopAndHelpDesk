


from django.shortcuts import render, redirect
from django.http import HttpResponse
from customer import urls

from django.core.mail import send_mail
from django.conf import settings

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='computer_shop')
print('Successfully connected to database')
cur = conn.cursor()

# Create your views here.

def index(request):
    return render(request,'customer/index.html')

def aboutus(request):
    return render(request,'customer/aboutus.html')

def contactus(request):
    return render(request,'customer/contactus.html')


def login(request):
    if request.method == 'POST':
        print(request.POST)
        user_email = request.POST['email123']
        user_password = request.POST['password']
        cur.execute("select * from `tbl_user_mst` where `user_email` = '{}' and `user_password` = '{}'".format(user_email,user_password))
        data = cur.fetchone()
        
        if data is not None:

            if len(data) > 0:
                #Fetch Data
                admin_db_id = data[0]
                admin_db_email = data[1]
                print(admin_db_id)
                print(admin_db_email)
                #Session Create Code
                request.session['user_id'] = admin_db_id
                request.session['user_email'] = admin_db_email
                #Session Create Code
                #Cookie Code
                response = redirect(index)
                response.set_cookie('user_id', admin_db_id)
                response.set_cookie('user_email', admin_db_email)
                return response
                #Cookie Code
            else:
                return render(request, 'customer/login.html') 
        return render(request, 'customer/login.html')
        
       # return redirect(dashboard) 
    else:
        return render(request, 'customer/login.html') 


def logout(request):
    
    del request.session['user_id']
    del request.session['user_email']
    response = redirect(login)
    response.delete_cookie('user_id')
    response.delete_cookie('user_email')
    return response   

# def login(request):
#     return render(request,'customer/login.html')

def signup(request):
    return render(request,'customer/signup.html')

def forgotpassword(request):
    return render(request,'customer/forgotpassword.html')

def myaccount(request):
    return render(request,'customer/myaccount.html')

# def shop(request):
#     return render(request,'customer/shop.html')

def shop(request):
    cur.execute("SELECT tbl_product_mst.product_id,  tbl_product_mst.product_image,  tbl_product_mst.product_name,  tbl_category_mst.category_name,  tbl_brand_mst.brand_name,  tbl_product_mst.product_qty, tbl_product_mst.product_price FROM tbl_product_mst  INNER JOIN tbl_category_mst ON tbl_product_mst.category_id =    tbl_category_mst.category_id  INNER JOIN tbl_brand_mst ON tbl_product_mst.brand_id = tbl_brand_mst.brand_id")
    data=cur.fetchall()
    print(list(data))
    return render(request,'customer/shop.html', { 'product' : data})

def product(request):
    return render(request,'customer/product.html')

def build(request):
    return render(request,'customer/build.html')

def buildselect(request):
    return render(request,'customer/buildselect.html')


def cart(request):
    return render(request,'customer/cart.html')

def checkout(request):
    return render(request,'customer/checkout.html')

# def faq(request):
#     return render(request,'customer/faq.html')

def faq(request):
    cur.execute("SELECT tbl_faq_mst.faq_id,  tbl_user_mst.user_name,  tbl_faq_mst.faq_question,  tbl_faq_mst.faq_answer FROM tbl_faq_mst  INNER JOIN tbl_user_mst ON tbl_user_mst.user_id = tbl_faq_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'customer/faq.html', {'faq': data}) 

def ticket(request):
    return render(request,'customer/ticket.html')

def feedback(request):
    return render(request,'customer/feedback.html')

def password_otp(request):
    return render(request,'customer/password_otp.html')

def changepassword(request):
    return render(request,'customer/changepassword.html')