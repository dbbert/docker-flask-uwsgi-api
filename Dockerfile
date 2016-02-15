FROM continuumio/miniconda3

RUN apt-get install -y python3-dev python-dev

RUN mkdir -p /code
COPY environment.yml /code/environment.yml
WORKDIR /code
RUN conda env create

EXPOSE 8001
VOLUME /opt/api
WORKDIR /opt/api/

CMD uwsgi --py-autoreload 1 /opt/api/uwsgi.ini
