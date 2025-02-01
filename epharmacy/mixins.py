from django.http import HttpResponseForbidden
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin

class AdminRequiredMixin(LoginRequiredMixin):
    required_role = 1  # Define the required role
    login_url = '/user/login/' # Define the login URL
    def dispatch(self, request, *args, **kwargs):
        
        # Check if the profile exists and if the role matches
        if hasattr(request.user, 'profile') and request.user.profile.role != self.required_role:
            return HttpResponseForbidden("You do not have permission to access this page.")
        
        # If the user has the required role, continue with the view
        return super().dispatch(request, *args, **kwargs)

class PharmacistRequiredMixin:
    required_role = 2  # Define the required role

    def dispatch(self, request, *args, **kwargs):
        # Ensure the user is authenticated and has the required role
        if not request.user.is_authenticated:
            return redirect('user:login')  # Redirect to login if not authenticated
        
        # Check if the profile exists and if the role matches
        if hasattr(request.user, 'profile') and request.user.profile.role != self.required_role:
            return HttpResponseForbidden("You do not have permission to access this page.")
        
        # If the user has the required role, continue with the view
        return super().dispatch(request, *args, **kwargs)
    
class ClientRequiredMixin(LoginRequiredMixin):
    required_role = 3  # Define the required role
    login_url = '/user/login/' # Define the login URL
    def dispatch(self, request, *args, **kwargs):
        
        # Check if the profile exists and if the role matches
        if hasattr(request.user, 'profile') and request.user.profile.role != self.required_role:
            return HttpResponseForbidden("You do not have permission to access this page.")
        
        # If the user has the required role, continue with the view
        return super().dispatch(request, *args, **kwargs)