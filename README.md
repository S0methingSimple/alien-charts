# UFOtaku Charts

Repository of third party operators and service Helm chart

## Setup

### Requirements

* [helm](https://helm.sh/docs/intro/install/)
* [gke-gcloud-auth-plugin](https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke)
* [kubeseal](https://github.com/bitnami-labs/sealed-secrets) 

### Installing Charts and Secrets

You can use the following commands at the root of this repository to build and deploy this project:
```bash
# Helm install third party charts (argo-cd, traefik, postgresql, rabbitmq [Optional]: sealed-secrets, cert-manager, kube-prometheus-stack)
helm install 

# Setup secrets for ENV and Gitlab auth (/secret)
kubectl apply -f ./secret
```

### Portforward and Seed data to database

Portforward cluster postgresql create the tables and seed the data within databse.zip
```bash
kubectl port-forward --namespace default svc/postgresql 5432:5432
```

### Configure SSL certificate and DNS record

Update default tlsStore with site certificate and update DNS record with external-ip of traefik 
```bash
kubectl get service -n kube-system traefik
```

### Setup Argocd

Follow the documentation to [setup argocd](https://argo-cd.readthedocs.io/en/stable/getting_started/), port forward to get access to the argo server
```bash
kubectl port-forward --namespace argocd svc/argocd-server 8081:443
```

### Configure values.yaml of the services

Configure chart values in manifest (/manifest) as required and deploy the argo apps
```bash
kubectl apply -f ./argocd/apps --namespace argocd
```


