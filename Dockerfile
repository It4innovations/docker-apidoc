FROM ubuntu:latest

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y -y python-pip libcurl4-openssl-dev gcc libssl-dev curl gunicorn git pandoc

RUN pip install pip --upgrade
#RUN pip install setuptools --upgrade \
# && pip install pylint \
# && pip install autopep8 \
# && pip install pyresttest \
# && pip install flask flask-jsonpify flask-sqlalchemy flask-restful

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
