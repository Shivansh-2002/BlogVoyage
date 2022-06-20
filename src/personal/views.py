from ast import operator
from django.shortcuts import render
from blog.models import BlogPost
from operator import attrgetter

# Create your views here.
def home_screen_view(request):
    context = {}
    query = ""
    if request.GET:
        query = request.GET['q']
        context['query'] = str(query)
        
    blog_post = sorted(BlogPost.objects.all(), key=attrgetter('date_updated'), reverse=True)
    context['blog_post'] = blog_post


    
    return render(request, "personal/home.html", context)
