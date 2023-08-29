FROM python:slim

LABEL maintainer="lll9p <lll9p.china@gmail.com>"

ENV VERSION=3.3.0
ENV TZ=Asia/Shanghai

RUN set -eux;\
    apt-get update && DEBIAN_FRONTEND="noninteractive" TZ="$TZ" apt-get install -y tzdata;\
    pip install --upgrade pip;\
    pip install --upgrade setuptools;\
    pip install --prefer-binary --upgrade dtale==$VERSION;\
    rm -rf /root/.cache

WORKDIR /app

EXPOSE 8080
CMD ["dtale", "--port", "8080", "--app-root", "/app"]
