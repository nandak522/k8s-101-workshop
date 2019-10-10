### Day-1 Agenda
* Intro to Containers
* Intro to K8s
* Proceed to hello-universe-flask-app/README.md

### Instructions
```sh
cd hello-universe-flask-app
docker build -t local/hello-universe:v1 .
docker run -p 9999:9999 -it local/hello-universe:v1
# Open http://0.0.0.0:9999/
```
