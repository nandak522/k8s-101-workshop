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
kubect -n hello-universe get deploy
kubect -n hello-universe get po
kubect -n hello-universe get cm
```
