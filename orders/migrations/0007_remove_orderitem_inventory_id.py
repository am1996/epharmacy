# Generated by Django 4.2.3 on 2024-12-25 20:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0006_order_comment'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderitem',
            name='inventory_id',
        ),
    ]
