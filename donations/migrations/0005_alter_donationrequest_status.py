# Generated by Django 4.2.3 on 2025-01-06 22:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('donations', '0004_alter_donation_received_by_alter_donation_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='donationrequest',
            name='status',
            field=models.IntegerField(choices=[(0, 'Rejected'), (1, 'Pending'), (2, 'Approved'), (3, 'Donation Sent')], default=1),
        ),
    ]
