from django.db import models

# Create your models here.

#company
class Company(models.Model):
    comapny_name = models.CharField(max_length=45)
    company_registered_date = models.DateTimeField()
    company_id_key = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'company'

#gender
class Gender(models.Model):
    gender_primary_id = models.AutoField(primary_key=True)
    emp_id = models.IntegerField()
    gender_id = models.IntegerField()
    gender = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'gender'

#names
class Names(models.Model):
    names_id = models.AutoField(primary_key=True)
    emp_id = models.IntegerField()
    emp_name = models.CharField(max_length=127)
    emp_contact_number = models.IntegerField(db_column='emp_contact_Number')  # Field name made lowercase.
    company_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'names'


#username and password
class UsernameAndPass(models.Model):
    emp_id = models.AutoField(primary_key=True)
    emp_username = models.CharField(max_length=127)
    emp_pass = models.CharField(max_length=127)

    class Meta:
        managed = False
        db_table = 'username_and_pass'

#employee rating
class Rating(models.Model):
    rating_id = models.AutoField(primary_key=True)
    emp_id = models.IntegerField()
    emp_rating = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'rating'

#Position Table
class Position(models.Model):
    position_id = models.AutoField(primary_key=True)
    emp_id = models.IntegerField()
    emp_position_id = models.IntegerField()
    emp_position_name = models.CharField(max_length=32)
    company_id = models.IntegerField()
    manager_id = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'position'
