#!/bin/sh

# 运行 collectstatic
python manage.py collectstatic --noinput

python manage.py migrate

# 启动 uWSGI
exec uwsgi --ini /etc/uwsgi/uwsgi.ini
