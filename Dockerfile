FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y python-pip libcurl4-openssl-dev gcc libssl-dev curl gunicorn git pandoc openssh-client rsync

RUN pip install --upgrade pip setuptools

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

RUN useradd -lM coverage
