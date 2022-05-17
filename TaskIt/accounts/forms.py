from accounts import models
from django import forms

position_choices = (
    ("1", "employee"),
    ("2", "sub-manager"),
    ("3", "manager"),
)

gender_choices = (
    ("1", "male"),
    ("2", "females"),
)

class signupform(forms.ModelForm):
    username = forms.CharField(required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)
    position = forms.ChoiceField(choices=position_choices, required=True)
    gender = forms.ChoiceField(choices=gender_choices, required=True)

    