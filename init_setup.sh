#!/bin/bash
sudo chmod a+x system_update.sh
sudo chmod a+x project_setup.sh
sudo chmod a+x nginx_setup.sh
sudo chmod a+x start_gunicorn.sh

source system_update.sh
source project_setup.sh
source nginx_setup.sh
cp start_gunicorn.sh /var/app/healthchecks-f-society/start_gunicorn.sh
source /var/app/healthchecks-f-society/start_gunicorn.sh
