from django.shortcuts import render,redirect
from django.views import View
from django.contrib.auth import authenticate,login
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from .forms import *

class UserRegisterView(CreateView):
    form_class = RegisterationForm

    success_url = reverse_lazy('login')
    template_name = 'users/register.html'

class UserLoginView(View):
    def get(self,request):
        return render(request,"users/login.html",{"login_form":LoginForm})

    def post(self,request):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect('home')

        else:
            form = LoginForm()

        return render(request, 'login.html', {'form': form})

