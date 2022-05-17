from django.shortcuts import redirect, render
from accounts.models import Company, Rating, UsernameAndPass,Gender,Position,Names
from django.contrib.auth import authenticate
from django.db.models import Q;
from django.contrib.auth import login,logout,authenticate

# Create your views here.

def home(request):
    return render(request,"SignupLogin.html")



def register(request):
    if request.method == 'POST':
        empl_name = request.POST['emp_name']
        user_name = request.POST['username']
        password = request.POST['password'] 
        position = request.POST['position']   
        emp_gender = request.POST['gender']
        contact = request.POST['contact_no']
        manager = request.POST['manager']

        names = Names()
        user_pass = UsernameAndPass()
        emp_position = Position()
        employee_gender = Gender()

        user_pass.emp_username = user_name
        user_pass.emp_pass = password
        user_pass.save()



        
        employee_id = user_pass.emp_id
        
        rating = Rating()
        rating.emp_id = employee_id
        rating.emp_rating = 0
        rating.save()
        
        emp_comapny_id = request.session.get("company_id")
        names.emp_id = employee_id
        names.emp_name = empl_name
        names.emp_contact_number = contact
        names.company_id = emp_comapny_id
        names.save()



        emp_position.emp_id = employee_id
        emp_position.company_id = emp_comapny_id
        if position == "employee":
            emp_position.emp_position_id = 1
            emp_position.emp_position_name = "employee"
        elif position == "sub-manager":
            emp_position.emp_position_id = 2
            emp_position.emp_position_name = "sub-manager"
        elif position == "manager":
            emp_position.emp_position_id = 3
            emp_position.emp_position_name = "manager"
        emp_position.manager_id = manager
        emp_position.save()

        if emp_gender == "Male":
            employee_gender.gender_id = 1
            employee_gender.gender = "Male"
        elif emp_gender == "Female":
            employee_gender.gender_id = 2
            employee_gender.gender = "Female"
        employee_gender.emp_id = employee_id
        employee_gender.save()
        
        return render(request,'SignupLogin.html')

def login(request):
    if request.method == 'POST':
        username = request.POST["username"]
        password = request.POST["password"]

        query1 = 'SELECT * FROM taskit.username_and_pass where emp_username="{uname}" AND emp_pass="{userpass}"'.format(uname=username,userpass=password)
        print(query1)
        user = UsernameAndPass.objects.raw(query1)
        
            
        if len(list(user))>0:
            
            employee_id = user[0].emp_id
            employee_username = user[0].emp_username
            
            query3 = "SELECT * FROM taskit.names where emp_id={id}".format(id =employee_id )
            empl_company_raw = Names.objects.raw(query3)
            
            emp_name = empl_company_raw[0].emp_name
            emp_compay_id = empl_company_raw[0].company_id

            request.session['userid'] = employee_id
            request.session['username']= employee_username
            request.session['empname']= emp_name

            query2 = "SELECT * FROM taskit.position where emp_id={id}".format(id =employee_id )
            employee_position = Position.objects.raw(query2)

            position = employee_position[0].emp_position_id
            
            request.session['user_position'] = position
            if position == 4:
                name = Names.objects.get(emp_id = employee_id)
                comp_id = name.company_id
                request.session['company_id'] = comp_id
                
                manager_id_list = Position.objects.filter(Q(emp_position_id = 2) | Q(emp_position_id = 3) & Q(company_id = comp_id))
                
                manager_list = []
                
                for manager_or_sub in manager_id_list:
                    manager = Names.objects.get(emp_id = manager_or_sub.emp_id)
                    manager_list.append(manager)
                return render(request,'SignupLogin.html',{"position":position,"managers":manager_list})
            else:
                name = Names.objects.get(emp_id = employee_id)
                company_name = Company.objects.get(company_id_key = name.company_id).comapny_name
                user = UsernameAndPass.objects.get(emp_id = employee_id)
                gender = Gender.objects.get(emp_id = employee_id).gender_id
                if (position != 3):
                    rating = Rating.objects.get(emp_id = employee_id).emp_rating
                    return render(request,"loginresult.html",{'position':position,'name':name,'company_name':company_name,'user':user,'gender':gender,'rating':rating})
                else:
                    return render(request,"loginresult.html",{'position':position,'name':name,'company_name':company_name,'user':user,'gender':gender})
            
        else:
            message = "incorrect credentials"
            return render(request,"SignupLogin.html",{'message':message})



def logoutuser(request):
        logout(request)
        return redirect('home')
    