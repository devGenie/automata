source $(which virtualenvwrapper.sh)
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
mkvirtualenv healthchecks-f-society
workon healthchecks-f-society

sudo mkdir -p  /var/app/healthchecks-f-society
sudo chmod 755 /var/app/
sudo chown -R $(whoami) /var/app/
cd /var/app/

git clone https://github.com/andela/healthchecks-f-society
cd healthchecks-f-society

pip install -r requirements.txt
python manage.py migrate

cd /home/automata
