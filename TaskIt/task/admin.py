from task.models import TaskComments, TaskFile, TaskRating, Tasks, Title
from django.contrib import admin

# Register your models here.
admin.site.register(Tasks)
admin.site.register(TaskComments)
admin.site.register(TaskFile)
admin.site.register(TaskRating)
admin.site.register(Title)
