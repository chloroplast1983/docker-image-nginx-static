FROM nginx:1.13
MAINTAINER chloroplast "41893204@qq.com"

ADD ./conf/nginx.conf   /etc/nginx/nginx.conf
ADD ./conf/conf.d/*     /etc/nginx/conf.d/

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ONBUILD COPY ./html/ /var/www/html/
WORKDIR /var/www/html
