FROM nginx
MAINTAINER Florian Hoedt

# copy SSL certificates
COPY privkey.pem  /etc/nginx/privkey.pem
COPY fullchain.pem /etc/nginx/fullchain.pem

COPY nginx.ssl.conf /etc/nginx/nginx.conf