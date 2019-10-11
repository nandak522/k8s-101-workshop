### Sample Helpful Commands
```sh
# For Testing templates
helm3 template --namespace <namespace> --debug --execute templates/namespace.yaml --values hello-universe-chart/values.yaml hello-universe-chart
helm3 template --debug --execute templates/namespace.yaml --values hello-universe-chart/values.yaml hello-universe-chart
```

```sh
# For Testing
helm3 install hello-universe-sprint-release --dry-run --values hello-universe-chart/values.yaml hello-universe-chart
# Or For doing releases
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values.yaml hello-universe-chart
# or
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values-qa.yaml hello-universe-chart
# or
helm3 install hello-universe-sprint-release --wait --values hello-universe-chart/values-prod.yaml hello-universe-chart
```

```sh
# For Testing
helm3 upgrade --reuse-values --debug --dry-run hello-universe-sprint-release --values hello-universe-chart/values.yaml hello-universe-chart
# Or For real Upgrades
helm3 upgrade --reuse-values --debug hello-universe-sprint-release --values hello-universe-chart/values.yaml hello-universe-chart
```
