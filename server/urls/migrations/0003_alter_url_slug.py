# Generated by Django 3.2.6 on 2021-08-25 17:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("urls", "0002_url_slug"),
    ]

    operations = [
        migrations.AlterField(
            model_name="url",
            name="slug",
            field=models.CharField(max_length=100, unique=True),
        ),
    ]