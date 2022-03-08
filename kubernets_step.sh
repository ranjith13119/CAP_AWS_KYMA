1. create CAP Project
2. Configure the Package.json
3. create a AWS ECR repo
4. create a github pipeline to build,run,push the docker image to AWS by configuring the secrets
5. Create a kubernetes.io/dockerconfigjson type secret in kubernetes with the below comment.
#https://medium.com/@danieltse/pull-the-docker-image-from-aws-ecr-in-kubernetes-dc7280d74904
kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=AWS --docker-password=<your-pword> --docker-email=<your-email>
# run command "aws ecr get-login-password --region <region-name>" to get the password
6. Create a configmap to store the hana vcap variable 
7. create a deployment file and provide the secret and configmap details to the containers and expose as a service to consume outside the kyma.

kubectl create -f <deplyment.file.name> --record
kubectl set image deployment/kyma2 containername=newimagename --record
kubectl rollout status deployment/kyma2
kubectl rollout history deployment/kyma2
kubectl rollout undo deployment/kyma2