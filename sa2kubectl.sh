#!/bin/bash

set -o errexit



# settings:
# cluster='prod' # cosmetic name
# server=<server address>
# secret=<sa-secret>
# sa=<app-role>
# ns=<sa-ns>


ca=$(kubectl get secret $secret -o=jsonpath='{.data.ca\.crt}')
token=$(kubectl  get secret $secret -o=jsonpath='{.data.token}' | base64 --decode)


echo "
---
apiVersion: v1
kind: Config
clusters:
  - name: ${cluster}
    cluster:
      certificate-authority-data: ${ca}
      server: ${server}
contexts:
  - name: ${sa}@${cluster}
    context:
      cluster: ${cluster}
      namespace: ${ns}
      user: ${sa}
users:
  - name: ${sa}
    user:
      token: ${token}
current-context: ${sa}@${cluster}
"
