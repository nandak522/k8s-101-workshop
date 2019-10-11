### Day-3 Agenda
* Skaffold
* Helm

### Instructions
```sh
cat skaffold-kubectl.yaml
skaffold dev -f skaffold-kubectl.yaml -v debug
skaffold dev -f skaffold-kubectl.yaml -v debug --trigger manual
```

### Sample Helm Commands
```sh
# For Testing templates
helm3 template --values hello-universe-chart/values.yaml --values hello-universe-chart/values-infra.yaml hello-universe-chart
```

```sh
# For Testing
helm3 install hello-universe-sprint-release --dry-run --values hello-universe-chart/values.yaml --values hello-universe-chart/values-infra.yaml hello-universe-chart
# Or For doing releases
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values.yaml --values hello-universe-chart/values-infra.yaml hello-universe-chart
# or
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values-qa.yaml --values hello-universe-chart/values-infra-qa.yaml hello-universe-chart
# or
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values-prod.yaml --values hello-universe-chart/values-infra-prod.yaml hello-universe-chart
```

```sh
# For Testing
helm3 upgrade --reuse-values --dry-run hello-universe-sprint-release --values hello-universe-chart/values.yaml hello-universe-chart
# Or For real Upgrades
helm3 upgrade --reuse-values hello-universe-sprint-release --values hello-universe-chart/values.yaml hello-universe-chart
```
