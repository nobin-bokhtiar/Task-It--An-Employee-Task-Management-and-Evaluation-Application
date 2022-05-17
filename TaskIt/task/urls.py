from django.urls import path
from task import views

urlpatterns = [
    
    path('tasks',views.tasklist,name='tasklist'),
    path('taskassign',views.givetask,name="givetask"),
    path("task_assign_to_empl", views.task_assignment, name="task_assignment"),
    path("check_task", views.taskturnin,name="task_turnin"),
    path("check_task_status",views.task_status,name="turnedin_task_status"),
    path("task_decide",views.task_decide,name="decision_decisions_decisions"),
    path("task_history",views.task_history,name="history"),
    path("user_comment",views.comment,name="comment"),
    path("check_assign_tasks",views.task_assign_check,name="check_assign_tasks"),
    path("loginresult",views.loginresult,name="loginresult")
]
