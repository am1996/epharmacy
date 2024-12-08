from django.shortcuts import render,redirect
from django.views import View
from django.contrib.auth import authenticate,login
from django.urls import reverse_lazy
from django.views.generic import ListView,DetailView,TemplateView
from django.contrib.auth.views import PasswordChangeView
from django.views.generic.edit import CreateView
from orders.models import *
from .forms import *

class UserDashboardView(ListView):
    model = Order
    pagination = 10
    template_name = "users/dashboard.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        orders = Order.objects.all().filter(status=1)
        context["orders"] = orders
        return context

class UserProfileView(TemplateView):
    template_name = "users/profile.html"

class CustomPasswordChangeView(PasswordChangeView):
    form_class = PasswordChangeCustomForm
    template_name = 'users/password_change.html' 
    success_url = reverse_lazy('users:profile')

class UserProfileEditView(View):
    template_name = 'users/edit_profile.html'

    def get(self, request, *args, **kwargs):
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)
        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

    def post(self, request, *args, **kwargs):
        user_form = UserEditForm(request.POST, instance=request.user)
        profile_form = ProfileEditForm(request.POST, instance=request.user.profile)

        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            return redirect('profile')  # Redirect to a profile page or success page

        return render(request, self.template_name, {
            'user_form': user_form,
            'profile_form': profile_form,
        })

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

