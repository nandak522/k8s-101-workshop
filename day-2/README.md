### Day-2 Agenda
* Intro to K8s
* Installing Minikube
* kubectl
* Building blocks of K8s.
* Playing with deployments.

### Instructions
```sh
cd k8s
kubectl apply -f hello-universe.yaml
kubectl get ns
kubectl -n hello-universe get deploy
kubectl -n hello-universe get po
kubectl -n hello-universe get cm
kubectl -n hello-universe get svc
minikube service hello-universe -n hello-universe
# on linux: $ open localhost:32000 in the browser
# on mac: $ open <vm-ip>:32000 in the browser
```
