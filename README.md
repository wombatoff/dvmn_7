# [wombatoff.com](https://www.wombatoff.com/) - cайт доставки еды Star Burger

Это сайт сети ресторанов Star Burger. Здесь можно заказать превосходные бургеры с доставкой на дом.

![скриншот сайта](https://dvmn.org/filer/canonical/1594651635/686/)


Сеть Star Burger объединяет несколько ресторанов, действующих под единой франшизой. У всех ресторанов одинаковое меню и одинаковые цены. Просто выберите блюдо из меню на сайте и укажите место доставки. Мы сами найдём ближайший к вам ресторан, всё приготовим и привезём.

На сайте есть три независимых интерфейса. Первый — это публичная часть, где можно выбрать блюда из меню, и быстро оформить заказ без регистрации и SMS.

Второй интерфейс предназначен для менеджера. Здесь происходит обработка заказов. Менеджер видит поступившие новые заказы и первым делом созванивается с клиентом, чтобы подтвердить заказ. После оператор выбирает ближайший ресторан и передаёт туда заказ на исполнение. Там всё приготовят и сами доставят еду клиенту.

Третий интерфейс — это админка. Преимущественно им пользуются программисты при разработке сайта. Также сюда заходит менеджер, чтобы обновить меню ресторанов Star Burger.

## Как запустить prod-версию сайта

Скачайте код:
```
git clone https://github.com/wombatoff/dvmn_7.git
```

Перейдите в каталог проекта:
```
cd dvmn_7
```


В папке /infra cоздать файл .env и заполнить его:
```
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
```

В папке /backend cоздать файл .env и заполнить его:

```
DEBUG=False
SECRET_KEY=
ALLOWED_HOSTS=
YANDEX_API_KEY=
DATABASE_URL=postgresql://
ROLLBAR_ACCESS_TOKEN=
```

Перейдите в каталог /infra:
```
cd infra
```

Запустить установку Docker compose:
```
sudo docker-compose up -d --build
```

После развертывания сервисов сделать миграции и создать суперпользователя:
```
sudo docker-compose exec backend python manage.py migrate
sudo docker-compose exec backend python manage.py createsuperuser
```
В папке /infra сделать скрипт nginx.sh исполняемым:
```
chmod +x nginx.sh
```
Запустить скрипт настройки nginx:
```
sudo ./nginx.sh
```


### Автор:
[Wombatoff](https://github.com/wombatoff/)
