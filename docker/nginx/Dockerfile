FROM nginx
MAINTAINER Florian Hoedt

# copy SSL certificates
COPY cert.tisdar.thuenen.de.pem  /etc/nginx/cert.tisdar.thuenen.de.pem
COPY key.pem /etc/nginx/key.pem

COPY nginx.ssl.conf /etc/nginx/nginx.conf