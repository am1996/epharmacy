from django.shortcuts import render,redirect
from django.views import View
from django.contrib.auth import authenticate,login
from .forms import LoginForm
# Create your views here.

class UserLoginView(View):
    def get(self,request):
        return render(request,"login.html",{"login_form":LoginForm})

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