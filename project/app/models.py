from django.db import models


class ModelToTest(models.Model):
    name = models.CharField(max_length=50)
    file = models.FileField()
    image = models.ImageField()

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Тестовая модель'
        verbose_name_plural = 'Тестовые модели'