FROM python:slim

LABEL maintainer="lll9p <lll9p.china@gmail.com>"

ENV VERSION 3.3.0
ENV TZ Asia/Shanghai

RUN set -eux;\
    apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="$TZ" apt-get install -y tzdata;\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
    echo $TZ > /etc/timezone;\
    pip install --upgrade pip;\
    pip install --upgrade setuptools;\
    pip install --prefer-binary --upgrade dtale==$VERSION;\
    rm -rf /root/.cache;\
    mkdir /root/.config
COPY ./dtale.ini /root/.config/dtale.ini

WORKDIR /app

EXPOSE 8080
CMD ["dtale"]
