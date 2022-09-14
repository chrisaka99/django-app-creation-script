#!/bin/bash

Confirm_var="no"

echo "Scaffolding django app..."

while [ $Confirm_var != 'yes' ]; do
    read -p "project name : " Project_name
    read -p "venv name : " Env
    echo "project name: $Project_name"
    echo "venv name: $Env"
    read -p "Is everything correct [yes/no]? " Confirm_var
done

# create the folder
mkdir $Project_name && cd $Project_name

python3 -m venv $Env && source "$Env/bin/activate"

# install Django
python -m pip install django=="4.1.1"
python -m pip freeze > requirements.txt

django-admin startproject "${Project_name}_project" .
python manage.py startapp "${Project_name}_app"