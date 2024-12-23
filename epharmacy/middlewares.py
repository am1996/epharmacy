from django.http import HttpResponseForbidden
from django.urls import reverse

class LoginAnonymousGuardMiddleware:
    disallow_for_loggedin_user = [
        reverse("user:login"),
        reverse("user:register"),
    ]
    disallow_for_non_loggedin_user = [
        reverse("user:dashboard"),
        reverse("user:profile"),
        reverse("user:logout"),
        reverse("user:changepassword"),
        reverse("user:changepassword"),
    ]
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        #Disallow for authenticated users login and register
        if request.path in self.disallow_for_loggedin_user and request.user.is_authenticated:
            return HttpResponseForbidden("Forbidden Access to Loggedin Users.")
        elif request.path in self.disallow_for_non_loggedin_user and not request.user.is_authenticated:
            return HttpResponseForbidden("Forbidden Access to non Loggedin Users.")
        
        response = self.get_response(request)
        return response