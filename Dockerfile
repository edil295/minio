FROM python:latest

ADD requirements.txt /srv/requirements.txt

RUN apt-get install -y libpq-dev \
    && python -m pip install --upgrade pip \
    && python -m pip install -r /srv/requirements.txt

ADD . /srv
WORKDIR /srv

RUN echo "Europe/Moscow" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

CMD  ['/bin/sh','-c','python manage.py migrate --noinput && python main.py']