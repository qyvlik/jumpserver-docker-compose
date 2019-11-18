# http://docs.jumpserver.org/zh/docs/setup_by_ubuntu18.html
FROM ubuntu:18.04

ENV OPT_PATH /opt
ENV JUMPSERVER_PATH ${OPT_PATH}/jumpserver
ENV JUMPSERVER_TAG 1.5.4
ENV JUMPSERVER_HTTP_LISTEN_PORT 8080

# https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget gcc libffi-dev git

RUN apt-get -y install python3.6-dev python3-venv

RUN cd ${OPT_PATH} && \
     git clone --branch ${JUMPSERVER_TAG} --depth=1 https://github.com/jumpserver/jumpserver.git

RUN cd ${JUMPSERVER_PATH}/requirements && \
    apt-get -y install $(cat deb_requirements.txt)

ENV PY_VENV_NAME py3

RUN cd ${OPT_PATH} && \
    python3.6 -m venv ${PY_VENV_NAME}

RUN cd ${JUMPSERVER_PATH}/requirements && \
    /bin/bash -c "source ${OPT_PATH}/${PY_VENV_NAME}/bin/activate && pip install --upgrade pip setuptools" && \
    /bin/bash -c "source ${OPT_PATH}/${PY_VENV_NAME}/bin/activate && pip install -r requirements.txt"

RUN rm -rf /var/lib/apt/lists/*

VOLUME /tmp
VOLUME ${JUMPSERVER_PATH}/data
VOLUME ${JUMPSERVER_PATH}/tmp
VOLUME ${JUMPSERVER_PATH}/logs

EXPOSE ${JUMPSERVER_HTTP_LISTEN_PORT}

# websocket
EXPOSE 8070

WORKDIR ${OPT_PATH}

COPY docker-entrypoint.sh .

RUN chmod 755 ./docker-entrypoint.sh

RUN addgroup --gid 1024 jumpserver && \
    adduser --disabled-password --gecos "" --force-badname --ingroup jumpserver jumpserver && \
    chown jumpserver:jumpserver -R ${JUMPSERVER_PATH}

USER jumpserver

CMD ["./docker-entrypoint.sh"]
