from queue import PriorityQueue
from tabnanny import verbose
from django.db import models


# Priority = [ ("H", "High"), ("L", "Low"), ("M", "Medium") ]
# Create your models here.
#class Question(models.Model):
#    title           = models.CharField(max_length= 60)
#    question        = models.TextField(max_length=600)
#    priority        = models.CharField(max_length=1, choices=Priority)   
#    def __str__(self):
#       return self.title
#   class Meta:
#        verbose_name = "The Question"
#       verbose_name_plural = "Peoples Question"