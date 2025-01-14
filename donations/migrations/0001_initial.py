# Generated by Django 4.2.3 on 2025-01-05 22:14

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Donation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=300)),
                ('quantity', models.IntegerField()),
                ('comment', models.TextField()),
                ('image', models.ImageField(upload_to='donations/')),
                ('status', models.CharField(choices=[(1, 'Pending'), (2, 'Under Approval'), (3, 'Approved And Received'), (4, 'Donation Sent')], default=1, max_length=30)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('approved_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='approved_donations', to=settings.AUTH_USER_MODEL)),
                ('donated_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='donations', to=settings.AUTH_USER_MODEL)),
                ('received_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='received_donations', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
