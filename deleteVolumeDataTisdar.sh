#!/bin/bash
set -e

echo removing dbdata data ..
rm /media/data/dockerdata/dbdata/* -Rf
echo dbdata data removed

echo removing dbbackups data ..
rm /media/data/dockerdata/dbbackups/* -Rf
echo dbbackups data removed

echo removing geoserver data ..
rm /media/data/dockerdata/geoserver/* -Rf
echo geoserver data removed

echo removing statics data ..
rm /media/data/dockerdata/statics/* -Rf
echo statics data removed

echo removing django data ..
rm /media/data/dockerdata/logs/django/* -Rf
echo django data removed

echo removing nginx data ..
rm /media/data/dockerdata/logs/nginx/* -Rf
echo nginx data removed

echo dockerdata was purged