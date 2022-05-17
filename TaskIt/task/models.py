from django.db import models

# Create your models here.

#status table
class Status(models.Model):
    status_id = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    task_status = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'status'

#task comments table
class TaskComments(models.Model):
    task_comments_primary = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    commenter_id = models.IntegerField()
    task_comment = models.TextField()

    class Meta:
        managed = False
        db_table = 'task_comments'

# task files
class TaskFile(models.Model):
    task_file_id = models.AutoField(primary_key=True)
    task_id = models.CharField(max_length=45)
    file_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'task_file'


# task rating table
class TaskRating(models.Model):
    task_rating_id = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    task_rating = models.FloatField()

    class Meta:
        managed = False
        db_table = 'task_rating'


#task table
class Tasks(models.Model):
    task_id = models.AutoField(primary_key=True)
    task_recepient_id = models.IntegerField()
    task_provider_id = models.IntegerField()
    issue_date = models.DateField()
    deadline_date = models.DateField()
    completion_date = models.DateField(blank=True, null=True)
    task_desc = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'tasks'

#task title table
class Title(models.Model):
    task_title_id = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    task_title = models.TextField()

    class Meta:
        managed = False
        db_table = 'title'




