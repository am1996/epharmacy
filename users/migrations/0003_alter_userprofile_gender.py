# Generated by Django 5.1.4 on 2025-01-03 17:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("users", "0002_alter_userprofile_user"),
    ]

    operations = [
        migrations.AlterField(
            model_name="userprofile",
            name="gender",
            field=models.IntegerField(choices=[(1, "Male"), (2, "Female")], default=1),
        ),
    ]