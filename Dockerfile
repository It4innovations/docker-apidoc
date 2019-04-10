FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y python-pip libssl-dev libcurl4-openssl-dev python-dev \
                       mysql-client python-mysqldb git curl pandoc openssh-client rsync

RUN pip install --upgrade pip setuptools
RUN pip install pycurl pyresttest jmespath gunicorn

RUN useradd -lM coverage
