#Docker debe estar lanzado antes

#arrancar minikube en un contenedor Docker
minikube start --driver=docker --cpus=4 --memory=4096 --disk-size=20g

#Redirigir puertos para acceder a la UI
kubectl port-forward svc/argocd-server -n argocd 8080:443 > /dev/null 2>&1 &

#Redirigir los puertos de los entornos (No necesario si se usa ingress)
kubectl port-forward svc/dev-webapp-service 8081:80 -n dev &
kubectl port-forward svc/staging-webapp-service 8082:80 -n staging &
kubectl port-forward svc/prod-webapp-service 8083:80 -n prod &