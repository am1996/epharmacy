from django.http import HttpResponseForbidden

class LoginAnonymousGuardMiddleware:
    disallow_for_loggedin_user = ["login","register"]
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        #disallow for authenticated users login and register
        if any(word in request.path for word in self.disallow_for_loggedin_user) and request.user.is_authenticated:
            return HttpResponseForbidden()
        #TODO <User_Middleware> Disallow users to order
        response = self.get_response(request)
        return response