#!/bin/bash
python3 manage.py migrate
sudo systemctl daemon-reload
sudo systemctl restart gunicorn
sudo systemctl restart nginx
