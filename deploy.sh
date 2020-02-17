#!/bin/bash

if [ ! -d venv ]; then
    virtualenv -p python3 venv
fi

echo "[+] Activating venv"
source venv/bin/activate
echo "[+] Ensuring we have the latest deps"
pip3 install --upgrade -r requirements.txt

echo "[+] Pulling latest docs form Github"
git pull

echo "[+] Deploying to gh-pages"
mkdocs gh-deploy
