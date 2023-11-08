kc proxy
kc port-forward --namespace argocd svc/argocd-server 8081:443
kc port-forward --namespace default svc/rabbitmq 15672:15672
kc port-forward --namespace default traefik-888b685cd-8765h 9000:9000
kc port-forward --namespace default svc/postgresql 5432:5432
kc port-forward svc/prometheus-stack-grafana 3000:80 -n prometheus
kc port-forward svc/prometheus-stack-operated 9090:9090 -n prometheus