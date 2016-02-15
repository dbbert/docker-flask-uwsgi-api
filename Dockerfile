FROM continuumio/miniconda3

RUN mkdir -p /code
COPY environment.yml /code
WORKDIR /code
RUN conda env create

EXPOSE 8001
VOLUME /opt/api
WORKDIR /opt/api/

CMD uwsgi --py-autoreload 1 /opt/api/uwsgi.ini
