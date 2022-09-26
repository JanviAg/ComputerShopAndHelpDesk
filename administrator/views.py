from django.shortcuts import render, redirect
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
    return render(request,'administrator/index.html')

# def adminlogin(request):
#     return render(request,'administrator/adminlogin.html')

def adminlogin(request):
    if request.method == 'POST':
        print(request.POST)
        user_email = request.POST['email']
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
                return render(request, 'administrator/adminlogin.html') 
        return render(request, 'administrator/adminlogin.html')
        
       # return redirect(dashboard) 
    else:
        return render(request, 'administrator/adminlogin.html') 


def adminlogout(request):
    
    del request.session['user_id']
    del request.session['user_email']
    response = redirect(adminlogin)
    response.delete_cookie('user_id')
    response.delete_cookie('user_email')
    return response   

def adminforgotpassword(request):
    return render(request,'administrator/adminforgotpassword.html')

def usercustview(request):
    cur.execute("SELECT tbl_user_mst.user_id AS user_id,  tbl_user_mst.user_name AS user_name,  tbl_user_mst.user_email AS user_email,  tbl_user_mst.user_dob AS user_dob,  tbl_user_mst.user_gender AS user_gender,  tbl_user_mst.user_mobile AS user_mobile,  tbl_user_mst.user_address AS user_address,  tbl_user_mst.isActive AS isActive,  tbl_user_mst.usertype AS usertype FROM tbl_user_mst WHERE tbl_user_mst.usertype LIKE 3")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'administrator/usercustview.html', {'customer': data})   

def usertechview(request):
    cur.execute("SELECT tbl_user_mst.user_id,  tbl_user_mst.user_name,  tbl_user_mst.user_email,  tbl_user_mst.user_dob,  tbl_user_mst.user_gender,  tbl_user_mst.user_mobile,tbl_user_mst.user_address,  tbl_user_mst.isApproved,  tbl_user_mst.usertype FROM tbl_user_mst WHERE tbl_user_mst.isApproved = 'True' AND tbl_user_mst.usertype = '2'")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/usertechview.html', {'technician': data})   

def usertechpending(request):
    cur.execute("SELECT tbl_user_mst.user_id,  tbl_user_mst.user_name,  tbl_user_mst.user_email,  tbl_user_mst.user_dob,  tbl_user_mst.user_gender,  tbl_user_mst.user_mobile,tbl_user_mst.user_address,  tbl_user_mst.isApproved,  tbl_user_mst.usertype FROM tbl_user_mst WHERE tbl_user_mst.isApproved = 'False' AND tbl_user_mst.usertype = '2'")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/usertechpending.html', {'technicianunapproved': data})

def brandadd(request):
    return render(request,'administrator/brandadd.html')

def brandedit(request,id):
    print(id)
    cur.execute("select * from `tbl_brand_mst` where `brand_id` = {}".format(id))
    data=cur.fetchone()
    print(list(data))
    return render(request,'administrator/brandedit.html', {'brand':data})

def brandupdate(request):
    if request.method=='POST':
        print(request.POST)
        brandid=request.POST['txthid']
        brandname=request.POST['txtbad']
        cur.execute("update `tbl_brand_mst` set `brand_name` ='{}' where `brand_id`='{}'".format(brandname,brandid))
        conn.commit()
        return redirect(brandview)
    else:
        return redirect(brandview)

def brandaddprocess(request):
    if request.method=='POST':
        print(request.POST)
        brandname=request.POST['txtbadd']
        cur.execute("INSERT INTO `tbl_brand_mst`(`brand_name`) VALUES ('{}')".format(brandname))
        conn.commit()
        return redirect(brandview)
    else:
        return redirect(brandview)

def brandview(request):
    cur.execute("SELECT * FROM `tbl_brand_mst`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'administrator/brandview.html', {'brand': data})  

def branddelete(request,id):
    print(id)
    cur.execute("delete from `tbl_brand_mst` where `brand_id` = {}".format(id))
    conn.commit()
    return redirect(brandview)

def categoryadd(request):
    return render(request,'administrator/categoryadd.html')

def categoryaddprocess(request):
    if request.method=='POST':
        print(request.POST)
        catname=request.POST['txtcat']
        cur.execute("INSERT INTO `tbl_category_mst`(`category_name`) VALUES ('{}')".format(catname))
        conn.commit()
        return redirect(categoryview)
    else:
        return redirect(categoryview)

def categoryview(request):
    cur.execute("SELECT * FROM `tbl_category_mst`")
    data=cur.fetchall()
    print(list(data))
    return render(request,'administrator/categoryview.html', { 'categories': data})

def categorydelete(request,id):
    print(id)
    cur.execute("delete from `tbl_category_mst` where `category_id` = {}".format(id))
    conn.commit()
    return redirect(categoryview)

def categoryedit(request,id):
    print(id)
    cur.execute("select * from `tbl_category_mst` where `category_id` = {}".format(id))
    data=cur.fetchone()
    print(list(data))
    return render(request,'administrator/categoryedit.html', {'category':data})

def categoryupdate(request):
    if request.method=='POST':
        print(request.POST)
        categoryid=request.POST['txthid']
        categoryname=request.POST['txtcat']
        cur.execute("update `tbl_category_mst` set `category_name` ='{}' where `category_id`='{}'".format(categoryname,categoryid))
        conn.commit()
        return redirect(categoryview)
    else:
        return redirect(categoryview)

def productadd(request):
    return render(request,'administrator/productadd.html')

def productaddprocess(request):
    if request.method=='POST':
        print(request.POST)
        pname=request.POST['txtpname']
        pcat=request.POST['txtpcat']
        pbrand=request.POST['txtpbrand']
        pimg=request.FILES['txtpimg'].name

        try:
            photo = request.FILES['txtpimg']
            f=open("/static/customer/assets/images/product/"+pimg, 'wb')
            for i in photo:
                f.write(i)
            f.close()
        except:
            pass

        pqty=request.POST['txtpqty']
        pprice=request.POST['txtpprice']
        # cur.execute("INSERT INTO `tbl_product_mst`(`product_name`,`category_id`,`brand_id`,`product_image`,`product_price`,`product_qty`) VALUES ('{}')".format(pname,pcat,pbrand,pimg,pprice,pqty))
        cur.execute("insert into `tbl_product_mst`(`product_name`,`category_id`,`brand_id`,`product_image`,`product_price`,`product_qty`) values ('{}','{}','{}','{}','{}','{}')".format(pname,pcat,pbrand,pimg,pprice,pqty))
        conn.commit()
        return redirect(productview)
    else:
        return redirect(productview)

def productview(request):
    cur.execute("SELECT tbl_product_mst.product_id,  tbl_product_mst.product_image,  tbl_product_mst.product_name,  tbl_category_mst.category_name,  tbl_brand_mst.brand_name,  tbl_product_mst.product_qty, tbl_product_mst.product_price FROM tbl_product_mst INNER JOIN tbl_brand_mst ON tbl_brand_mst.brand_id = tbl_product_mst.brand_id  INNER JOIN tbl_category_mst ON tbl_product_mst.category_id = tbl_category_mst.category_id")
    data=cur.fetchall()
    print(list(data))
    return render(request,'administrator/productview.html', { 'product' : data})

def productdelete(request,id):
    print(id)
    cur.execute("delete from `tbl_product_mst` where `product_id` = {}".format(id))
    conn.commit()
    return redirect(productview)

def productedit(request,id):
    print(id)
    cur.execute("select * from `tbl_product_mst` where `product_id` = {}".format(id))
    data=cur.fetchone()
    print(list(data))
    return render(request,'administrator/productedit.html', {'product':data})

def productupdate(request):
    if request.method=='POST':
        print(request.POST)
        productid=request.POST['txtphid']
        productname=request.POST['txtpname']
        pcat=request.POST['txtpcat']
        pbrand=request.POST['txtpbrand']
        pimg=request.FILES['txtpimg'].name

        try:
            photo = request.FILES['txtpimg']
            f=open("/static/customer/assets/images/product/"+pimg, 'wb')
            for i in photo:
                f.write(i)
            f.close()
        except:
            pass


        pprice=request.POST['txtpprice']
        pqty=request.POST['txtpqty']
        cur.execute("update `tbl_product_mst` set `product_name` ='{}',`category_id`={},`brand_id`={},`product_image`={},`product_price`={},`product_qty`={} where `product_id`='{}'".format(productname,pcat,pbrand,pimg,pprice,pqty,productid))
        conn.commit()
        return redirect(productview)
    else:
        return redirect(productview)


# def productview(request):
#     return render(request,'administrator/productview.html')

def orderview(request):    
    cur.execute("SELECT tbl_order_mst.order_id,  tbl_user_mst.user_name,  tbl_user_mst.user_address,  tbl_order_mst.order_datetime,  tbl_order_mst.order_status,  tbl_order_mst.order_total FROM tbl_order_mst JOIN tbl_user_mst ON tbl_order_mst.user_id = tbl_user_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'administrator/orderview.html', {'order': data})   

def orderitem(request):
    return render(request,'administrator/orderitem.html')

def paymentview(request):
    cur.execute("SELECT tbl_payment_mst.payment_id,  tbl_payment_mst.order_id,  tbl_user_mst.user_name,  tbl_payment_mst.payment_datetime,  tbl_payment_mst.payment_method,  tbl_payment_mst.payment_status FROM tbl_payment_mst INNER JOIN tbl_user_mst ON tbl_payment_mst.user_id = tbl_user_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/paymentview.html', {'payment': data}) 



def faqadd(request):
    return render(request,'administrator/faqadd.html')

def faqaddprocess(request):
    if request.method=='POST':
        print(request.POST)
        catname=request.POST['txtcat']
        cur.execute("INSERT INTO `tbl_faq_mst`(`faq_name`) VALUES ('{}')".format(catname))
        conn.commit()
        return redirect(faqview)
    else:
        return redirect(faqview)

def faqview(request):
    cur.execute("SELECT tbl_faq_mst.faq_id,  tbl_user_mst.user_name,  tbl_faq_mst.faq_question,  tbl_faq_mst.faq_answer FROM tbl_faq_mst  INNER JOIN tbl_user_mst ON tbl_user_mst.user_id = tbl_faq_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/faqview.html', {'faq': data}) 

# def faqview(request):
#     cur.execute("SELECT * FROM `tbl_faq_mst`")
#     data=cur.fetchall()
#     print(list(data))
#     return render(request,'administrator/faqview.html', { 'faqs': data})

def faqdelete(request,id):
    print(id)
    cur.execute("delete from `tbl_faq_mst` where `faq_id` = {}".format(id))
    conn.commit()
    return redirect(faqview)

def faqedit(request,id):
    print(id)
    cur.execute("select * from `tbl_faq_mst` where `faq_id` = {}".format(id))
    data=cur.fetchone()
    print(list(data))
    return render(request,'administrator/faqedit.html', {'faq':data})

def faqupdate(request):
    if request.method=='POST':
        print(request.POST)
        faqid=request.POST['txthid']
        faqname=request.POST['txtcat']
        cur.execute("update `tbl_faq_mst` set `faq_name` ='{}' where `faq_id`='{}'".format(faqname,faqid))
        conn.commit()
        return redirect(faqview)
    else:
        return redirect(faqview)

##################################

def ticketview(request):
    cur.execute("SELECT tbl_ticket_mst.ticket_id,  tbl_user_mst.user_name,  tbl_ticket_mst.ticket_query,  tbl_ticket_mst.ticket_remark,  tbl_ticket_mst.ticket_status FROM tbl_ticket_mst  INNER JOIN tbl_user_mst tbl_user_mst1 ON tbl_user_mst1.user_id =    tbl_ticket_mst.user_id  INNER JOIN tbl_user_mst ON tbl_ticket_mst.user_id = tbl_user_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/ticketview.html', {'ticket': data}) 

def feedbackview(request):
    cur.execute("SELECT tbl_feedback_mst.feedback_id,  tbl_user_mst.user_name,  tbl_feedback_mst.feedback_rating,  tbl_feedback_mst.feedback_desc FROM tbl_feedback_mst  INNER JOIN tbl_user_mst ON tbl_user_mst.user_id = tbl_feedback_mst.user_id")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request,'administrator/feedbackview.html', {'feedback': data}) 

def feedbackdelete(request,id):
    print(id)
    cur.execute("delete from `tbl_feedback_mst` where `feedback_id` = {}".format(id))
    conn.commit()
    return redirect(feedbackview)

def password_mail_otp(request):
    return render(request,'administrator/password_mail_otp.html')

def adminchangepassword(request):
    return render(request,'administrator/adminchangepassword.html')

def email(request):
    subject = 'Thank you for registering to our site!'
    message = 'Very happy to have you here!'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = ['receiver@gmail.com',]
    send_mail( subject, message, email_from, recipient_list )
    return redirect('redirect to a new page')