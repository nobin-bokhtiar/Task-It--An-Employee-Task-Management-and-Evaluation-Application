from django.core.checks import messages
from django.db.models.query_utils import Q
from task import emp_task
from task.models import Status, TaskComments, TaskFile, Tasks, Title, TaskRating
from django.shortcuts import redirect, render
from task.emp_task import task
from accounts.models import Company, Gender, Names, Position, Rating, UsernameAndPass
from datetime import date
# Create your views here.
def loginresult(request):
    empl_id = request.session.get("userid")
    position = request.session.get("user_position")

    name = Names.objects.get(emp_id = empl_id)
    company_name = Company.objects.get(company_id_key = name.company_id).comapny_name
    user = UsernameAndPass.objects.get(emp_id = empl_id)
    gender = Gender.objects.get(emp_id = empl_id).gender_id
    if (position != 3):
        rating = Rating.objects.get(emp_id = empl_id).emp_rating
        return render(request,"loginresult.html",{'position':position,'name':name,'company_name':company_name,'user':user,'gender':gender,'rating':rating})
    else:
        return render(request,"loginresult.html",{'position':position,'name':name,'company_name':company_name,'user':user,'gender':gender})

def tasklist(request):
    empl_id = request.session.get("userid")
    empl_pos = request.session.get("user_position")
    tasks_query = 'SELECT taskit.tasks.task_id, taskit.tasks.task_desc, taskit.tasks.deadline_date,taskit.status.task_status,taskit.title.task_title from taskit.tasks join taskit.status on taskit.tasks.task_id = taskit.status.task_id join taskit.title on tasks.task_id= taskit.title.task_id where task_recepient_id ={employee_id}  and task_status="active"'.format(employee_id=empl_id)
    task_rawquery = Tasks.objects.raw(tasks_query)
    employee_task = task()
    task_list = []
    
    for emp_task in task_rawquery:
        employee_task = task()
        comment_query = "SELECT * FROM taskit.task_comments where task_id = {id}".format(id=emp_task.task_id)
        employee_task.task_id = emp_task.task_id
        employee_task.task_title = emp_task.task_title
        print(employee_task.task_title)
        employee_task.task_desc = emp_task.task_desc
        comments_raw_query = TaskComments.objects.raw(comment_query)
        list_of_comments = list(comments_raw_query)
        i=0
        comments = {}
        for comment in list_of_comments:
            employee_comment = comment.task_comment
            commenter_name = Names.objects.get(emp_id = comment.commenter_id).emp_name
            comments[i] = {'commenter_name':commenter_name,'comment':employee_comment}
            i+=1
        employee_task.task_comment = comments
        print(employee_task.task_comment)
        employee_task.task_deadline = emp_task.deadline_date
        task_list.append(employee_task)
        
    print(task_list)
    return render(request,"tasks.html",{"tasks":task_list,"position":empl_pos})



def givetask(request):
    empl_id = request.session.get("userid")
    empl_pos = request.session.get("user_position")
    query = "SELECT position.emp_id as position_id,username_and_pass.emp_username FROM taskit.position join username_and_pass where manager_id = {id} and position.emp_id = username_and_pass.emp_id;".format(id=empl_id)
    emp_rawquery = Position.objects.raw(query)
    
    return render(request,"assigntask.html",{"employees":emp_rawquery,"position":empl_pos})

def task_assignment(request):
    empl_id = request.session.get("userid")
    empl_task = Tasks()
   
    recievers_id = request.POST['select_emp']
    task_title = request.POST['tasktitle']
    task_desc = request.POST['taskdesc']
    deadline = request.POST['deadline']

    empl_task.task_provider_id = empl_id
    empl_task.task_recepient_id = recievers_id
    empl_task.task_desc = task_desc
    empl_task.deadline_date = deadline
    empl_task.issue_date = date.today()

    empl_task.save()

    title = Title()
    title.task_title = task_title
    title.task_id = empl_task.task_id
    title.save()

    status = Status()
    status.task_id = empl_task.task_id
    status.task_status = "active"
    status.save()

    result = "Task assigned"

    return redirect("givetask")

def taskturnin(request):
    choosen_task_id = request.POST['task_id']
    status = Status.objects.get(task_id=choosen_task_id)
    status.task_status = "processing"
    status.save()
    
    task = Tasks.objects.get(task_id=choosen_task_id)
    task.completion_date = date.today()
    task.save()
    return redirect("loginresult")

def task_status(request):
    empl_id = request.session.get("userid")
    empl_pos = request.session.get("user_position")
    tasks_query = 'SELECT taskit.tasks.completion_date, taskit.tasks.task_id, taskit.tasks.task_desc, taskit.tasks.deadline_date,taskit.title.task_title from taskit.tasks join taskit.status on taskit.tasks.task_id = taskit.status.task_id join taskit.title on tasks.task_id= taskit.title.task_id where task_provider_id ={employee_id}  and task_status="processing"'.format(employee_id=empl_id)

    tasks = Tasks.objects.raw(tasks_query)
    

    return render(request,"task_status.html",{"tasks":tasks,"position":empl_pos})

def task_decide(request):
    position = request.session.get("user_position")
    empl_task_id = request.POST['task_id']
    task_decision = request.POST['task_decide']
    
    
    if task_decision == "reject":
        status = Status.objects.get(task_id=empl_task_id)
        status.task_status = "active"
        status.save()
        return redirect("loginresult")

    if task_decision == "accept":
        status = Status()
        status = Status.objects.get(task_id=empl_task_id)
        status.task_status = "completed"
        print(status.task_status)
        status.save()
        rating = TaskRating()
        rating.task_id = empl_task_id
        rating.task_rating = request.POST['rating']
        rating.save()
        
        empl_id = Tasks.objects.get(task_id = empl_task_id).task_recepient_id
        empployee_rating = Rating.objects.get(emp_id=empl_id)
        if empployee_rating.emp_rating == None:
            empployee_rating.emp_rating =0 + int(request.POST['rating'])        
        else:
            empployee_rating.emp_rating =empployee_rating.emp_rating + int(request.POST['rating'])
        empployee_rating.save()
        return redirect("loginresult")

def task_history(request):
    position = request.session.get("user_position")
    
    empl_id = request.session.get("userid")
    if position == 3:
        query = 'select tasks.task_id,task_desc,completion_date,deadline_date,title.task_title,task_rating.task_rating from tasks join status join title join task_rating where task_provider_id = {id}  and task_status="completed" and tasks.task_id = status.task_id and title.task_id=tasks.task_id and task_rating.task_id= tasks.task_id'.format(id=empl_id)
        tasks = Tasks.objects.raw(query)
        return render(request,"task_history.html",{"tasks":tasks,"position":position})
    else:    
        query = 'select tasks.task_id,task_desc,completion_date,deadline_date,title.task_title,task_rating.task_rating from tasks join status join title join task_rating where task_recepient_id = {id}  and task_status="completed" and tasks.task_id = status.task_id and title.task_id=tasks.task_id and task_rating.task_id = tasks.task_id'.format(id=empl_id)
        tasks = Tasks.objects.raw(query)
        return render(request,"task_history.html",{"tasks":tasks,"position":position})

def comment(request):
    if request.method =='POST' and 'input_comment' in request.POST:
        employee_id = request.session.get("userid")
        task_id = request.POST['task_id']
        user_comment = request.POST['user_comment']
        
        page_name = request.POST['page_name']

        comment = TaskComments()
        comment.task_id = task_id
        comment.task_comment = user_comment
        comment.commenter_id = employee_id
        comment.save()
        if page_name == 'task_list':
            return redirect('tasklist')
        elif page_name == 'check_assigned_tasks':
            return redirect('check_assign_tasks')


def task_assign_check(request):
    empl_id = request.session.get("userid")
    position = request.session.get("user_position")
    task_list = Tasks.objects.filter(task_provider_id = empl_id)
    ids = []
    list_of_tasks = []

    for emp_task in task_list:
        active_tasks = Status.objects.filter(task_id = emp_task.task_id)
        for active_task in active_tasks:
            if active_task.task_status == "active":
                ids.append(active_task.task_id) 
    for id in ids:
        empl_task = task()
        empl_task.task_id = id
        comments = TaskComments.objects.filter(task_id = id)
        empl_comments = {}
        i=0
        for comment in comments:
            commenter_name = Names.objects.get(emp_id = comment.commenter_id).emp_name
            empl_comments[i] = {'commenter_name':commenter_name,'comment':comment.task_comment}
            i+=1
        empl_task.task_comment = empl_comments
        tasks = Tasks.objects.get(task_id = id)
        empl_task.task_deadline = tasks.deadline_date
        empl_task.task_desc = tasks.task_desc
        empl_task.task_provider_name = Names.objects.get(emp_id = tasks.task_provider_id).emp_name
        empl_task.task_recipient_name = Names.objects.get(emp_id = tasks.task_recepient_id).emp_name
        empl_task.task_title = Title.objects.get(task_id = id).task_title
        list_of_tasks.append(empl_task)

    return render(request,"assignedtasks.html",{"tasks":list_of_tasks,"position":position})