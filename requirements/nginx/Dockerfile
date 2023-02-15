FROM debian:stable

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj "/C=''/ST=''/L=''/O=''/OU=''/CN=''"

COPY ./tools/default /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]

