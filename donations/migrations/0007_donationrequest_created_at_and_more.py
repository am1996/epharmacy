# Generated by Django 4.2.3 on 2025-01-09 21:44

from django.db import migrations, models
import django.utils.timezone
import donations.models


class Migration(migrations.Migration):

    dependencies = [
        ('donations', '0006_donationrequest_comment'),
    ]

    operations = [
        migrations.AddField(
            model_name='donationrequest',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='donationrequest',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='donationrequest',
            name='attachment',
            field=models.FileField(blank=True, null=True, upload_to=donations.models.upload_to_requested),
        ),
    ]
