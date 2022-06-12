# Getting Started

## Deploy SAP CAP to SAP Cloud Plateform, Kyma runtime using Private AWS ECR image and github action

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`Dockerfile` | configuration to create a image on AWS ECR
`kyma2\.github\workflows\deploy.yml` | Github pipeline setup to Build, tag, and push image to Amazon ECR
`deployment_kube.yaml` | Kubernets deployment configuration file
`FIORI Kyma deployment Repository` | https://github.com/ranjith13119/CAP_AWS_KYMA/tree/fiorikymanew

## Steps

- Create a CAP project using CAP template (without mta module).
- Configure the Package.json 
- Open new terminal and run `npm install`
- Register for a AWS trail account and Create a private AWS ECR repository 
- Create a github pipeline to build, run, push the docker image to AWS by configuring the secrets
- Create a `secret` and its type as `kubernetes.io/dockerconfigjson` in kubernetes with the below comment.
   `kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=AWS --docker-password=<your-pword> --docker-email=<your-email>`
   `kubectl create secret docker-registry --dry-run=client $secret_name docker-server=<DOCKER_REGISTRY_SERVER --docker-username=<DOCKER_USER> --docker-password=<DOCKER_PASSWORD>  --docker-email=<DOCKER_EMAIL> -o yaml > docker-secret.yaml`
- Create a `configmap` in kubernets to store the hava vcap variable (similar to `default-env.json`)
- Create a deployment file by providing the secret and configmap details to the containers and expose as a service to consume outside the kyma.
- `kubectl create -f <deplyment.file.name> --record`
- `kubectl set image deployment/kyma2 containername=newimagename --record`
- `kubectl rollout status deployment/kyma2`
- `kubectl rollout history deployment/kyma2`
- `kubectl rollout undo deployment/kyma2`
