#!/bin/bash
sudo bash -c 'cat << EOF > /etc/nginx/sites-available/default
upstream healthchecks_server {
	server 127.0.0.1:8000 fail_timeout=0;
}

server {
	listen 80;
	listen [::]:80;

	root /var/app/healthchecks;
	access_log /var/app/healthchecks-f-society/nginx.log;
	error_log /var/app/healthchecks-f-society/nginx-error.log;
	
	location / {
	  	include proxy_params;
		proxy_pass http://127.0.0.1:8000;
	}
}
EOF'

sudo ln -s /etc/nginx/sites-available/healthchecks /etc/nginx/sites-enabled
sudo nginx -t && sudo service nginx restart

sudo bash -c 'cat <<EOF > /etc/init/healthchecks.conf
description "Healthchecks gunicorn app starting"

start on runlevel [2345]
stop on runlevel [!2345]

respawn
setuid $(whoami)
setgid www-data

source /var/app/healthchecks-f-society/start_gunicorn.sh
EOF'
