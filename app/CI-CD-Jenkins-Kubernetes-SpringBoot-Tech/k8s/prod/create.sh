kubectl create ns production
kubectl apply -f secret.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f ingress.yml