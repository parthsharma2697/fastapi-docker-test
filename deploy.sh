aws cloudformation create-stack --stack-name demostack --template-body file://cfn.yml --capabilities CAPABILITY_NAMED_IAM

sleep 300

docker build -t fastapi .

docker tag fastapi:latest 610818512696.dkr.ecr.us-east-1.amazonaws.com/fastapi:latest

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 610818512696.dkr.ecr.us-east-1.amazonaws.com

docker push 610818512696.dkr.ecr.us-east-1.amazonaws.com/fastapi:latest

sleep 20

aws ecs register-task-definition --cli-input-json file://taskdefinition.json

sleep 20

aws ecs run-task --cluster demo --task-definition demotask:1


