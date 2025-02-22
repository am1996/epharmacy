# Generated by Django 4.2.17 on 2024-12-12 22:00

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0005_alter_orderitem_inventory_id'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('inventory', '0002_inventoryitemdispensed'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='batch_no',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='created_by',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='drug_id',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='expiry_date',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='manufacturing_date',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='pharmacist_price',
        ),
        migrations.RemoveField(
            model_name='inventoryitemdispensed',
            name='public_price',
        ),
        migrations.AddField(
            model_name='inventoryitemdispensed',
            name='dispensed_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='inventoryitemdispensed',
            name='dispensed_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='inventoryitemdispensed',
            name='inventory_item',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dispensed_items', to='inventory.inventoryitem'),
        ),
        migrations.AddField(
            model_name='inventoryitemdispensed',
            name='order',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='dispensed_items', to='orders.order'),
        ),
        migrations.AlterField(
            model_name='inventoryitemdispensed',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
        migrations.AlterField(
            model_name='inventoryitemdispensed',
            name='quantity',
            field=models.PositiveIntegerField(),
        ),
    ]
