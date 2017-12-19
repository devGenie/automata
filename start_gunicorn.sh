#!/bin/bash

APPNAME=healthchecks-f-society
APPDIR=/var/app/$APPNAME/

LOGFILE=$APPDIR'gunicorn.log'
ERRORFILE=$APPDIR'gunicorn-error.log'

NUM_WORKERS=3
ADDRESS=127.0.0.1:8000

cd $APPDIR
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

source $(which virtualenvwrapper.sh)
workon $APPNAME

exec gunicorn hc.wsgi:application \
-w $NUM_WORKERS --bind=$ADDRESS \
--log-level=debug \
--log-file=$LOGFILE 2>>$LOGFILE 1>>$ERRORFILE &

