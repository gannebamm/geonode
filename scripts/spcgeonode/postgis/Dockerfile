FROM mdillon/postgis:10
MAINTAINER GeoNode development team

# run with german locale
RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
ENV LANG de_DE.utf8

COPY ./initdb-geonode.sh /docker-entrypoint-initdb.d/geonode.sh
