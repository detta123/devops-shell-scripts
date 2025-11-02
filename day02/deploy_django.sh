#!/bin/bash

<< task 
Deploy a Django app
and handle the code for the errors
task

code_clone(){
   echo "Cloning the Django app.."
   git clone https://github.com/LondheShubham153/django-notes-app.git
}
install_requirements(){
  echo "Installing Dependencies"
  sudo apt-get update && sudo apt-get install docker.io nginx -y
}
required_restarts(){
 echo "Setting up Permissions and services"
 sudo usermod -aG docker $USER 
 newgrp docker
 sudo systemctl enable docker
 sudo systemctl enable nginx
 sudo systemctl restart docker
}
deploy(){
   echo "Building Docker Image...."
   docker build -t notes-app .
   echo "Starting Docker Container..."
   docker run -d -p 8000:8000 notes-app:latest
}
echo "**********DEPLOYMENT STARTED**********"


if ! code_clone
then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements
then
	echo "Installation failed"
	exit 1
fi
if !required_restarts 
then	
	echo "System fault identified"
	exit 1
fi
if !deploy; then
	echo "Deployment failed , kindly mail the admin"
	# sendmail
fi

cd ..

echo "**********DEPLOYMENT DONE**********"


