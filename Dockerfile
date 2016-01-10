FROM python:3.4-onbuild
EXPOSE 8001
VOLUME /opt/api
CMD uwsgi --py-autoreload 1 /opt/api/uwsgi.ini
