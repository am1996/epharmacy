# Generated by Django 4.2.3 on 2025-01-09 18:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('donations', '0005_alter_donationrequest_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='donationrequest',
            name='comment',
            field=models.TextField(blank=True, null=True),
        ),
    ]