from django.contrib import admin
from accounts.models import Company,Gender,UsernameAndPass,Names,Rating,Position
# Register your models here.

admin.site.register(Company)
admin.site.register(Gender)
admin.site.register(UsernameAndPass)
admin.site.register(Names)
admin.site.register(Rating)
admin.site.register(Position)