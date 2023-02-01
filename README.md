## Overview

Task at hand is to build a docker image of https://fastapi.tiangolo.com/#typer-the-fastapi-of-clis and deploy the same to ECS.


### About Files
    - main.py Contains the api call for fastapi.
    - requirements.txt Contains pre-requisites for deploying the fast api
    - Dockerfile The docker file to create a docker image
    - cfn.yml Cloud formation template to create ECS cluster, autoscaling group and ECR repo. You need to replace these with your ids <VPC-ID>, <subnet-id>, <securitygroup-id>.
    - taskdefinitiion.json Json template file for creating task in ECS cluster.
    -deploy.sh Usage :- ./deploy.sh . It executes the Cloud formation stack form cfn.yml, builds and pushes docker image to the ECR repo (change the ECR repo). Afterwards it registers task using taskdefinition.jsona and lastly runs it.

    The final output can be checked at <public_ip>:8000/docs 

