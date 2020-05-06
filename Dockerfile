FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get clean && \
    apt-get update -y && \
    apt-get install -y git curl pandoc openssh-client rsync virtualenv python-pip python-dev \
                       python-mysqldb default-mysql-client libssl-dev libcurl4-openssl-dev

RUN pip install --upgrade pip setuptools
RUN pip install sphinx sphinxcontrib-httpdomain sphinxcontrib-websupport gunicorn
RUN virtualenv -p python3 /opt/.venv3
RUN . /opt/.venv3/bin/activate && pip install --upgrade pip setuptools
RUN . /opt/.venv3/bin/activate && pip install sphinx sphinxcontrib-httpdomain sphinxcontrib-websupport \
                                              gunicorn

RUN useradd -lM coverage
