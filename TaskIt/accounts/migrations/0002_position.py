# Generated by Django 3.2.5 on 2021-07-18 09:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Position',
            fields=[
                ('position_id', models.AutoField(primary_key=True, serialize=False)),
                ('emp_id', models.IntegerField()),
                ('emp_position_id', models.IntegerField()),
                ('emp_position_name', models.CharField(max_length=32)),
                ('company_id', models.IntegerField()),
            ],
            options={
                'db_table': 'position',
                'managed': False,
            },
        ),
    ]