FROM ubuntu:xenial

# Set the locale
RUN apt-get clean \
 && apt-get update \
 && apt-get install -y locales \
 && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -y update && apt-get install -y python-pip libcurl4-openssl-dev gcc libssl-dev curl gunicorn git pandoc

RUN pip install pip --upgrade
#RUN pip install setuptools --upgrade \
# && pip install pylint \
# && pip install autopep8 \
# && pip install pyresttest \
# && pip install flask flask-jsonpify flask-sqlalchemy flask-restful

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
