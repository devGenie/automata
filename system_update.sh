#!/bin/bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

export LC_ALL="en_us.UTF-8"

wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install postgresql postgresql-contrib -y
sudo apt-get install git nginx python3 python3-pip -y

sudo chown -R $(whoami) /usr/local/lib/
sudo chown -R $(whoami) /home/$(whoami)

