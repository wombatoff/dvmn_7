# Generated by Django 3.2.15 on 2023-04-05 11:34

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0047_auto_20230405_1423'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='payment_method',
            field=models.CharField(choices=[('электронно', 'электронно'), ('наличными', 'наличными')], default='наличными', max_length=10, verbose_name='способ оплаты'),
        ),
        migrations.AlterField(
            model_name='order',
            name='call_date',
            field=models.DateTimeField(blank=True, null=True, verbose_name='дата звонка'),
        ),
        migrations.AlterField(
            model_name='order',
            name='delivery_date',
            field=models.DateTimeField(blank=True, null=True, verbose_name='дата доставки'),
        ),
        migrations.AlterField(
            model_name='order',
            name='order_date',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='дата заказа'),
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('новый', 'новый'), ('подтверждение менеджером', 'подтверждение менеджером'), ('обработка рестораном', 'обработка рестораном'), ('доставка курьером', 'доставка курьером'), ('завершен', 'завершен')], default='новый', max_length=36, verbose_name='статус заказа'),
        ),
    ]
