FROM continuumio/miniconda3

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get install -y python3-dev

RUN mkdir -p /code
COPY environment.yml /code/environment.yml
WORKDIR /code
RUN conda env create

EXPOSE 8001
VOLUME /opt/api
WORKDIR /opt/api/

CMD source activate investimize && uwsgi --py-autoreload 1 /opt/api/uwsgi.ini
