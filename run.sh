kubectl apply -f casandra.yaml
kubectl apply -f table-manager.yaml
kubectl apply -f consul.yaml 
kubectl apply -f memcached.yaml 
kubectl apply -f ingester.yaml
kubectl apply -f querier.yaml
kubectl apply -f queryfrontend.yaml
kubectl apply -f distributor.yaml 

kubectl apply -f configs-db-dep.yaml 
kubectl apply -f configs-dep.yaml 
kubectl apply -f alertmanager-dep.yaml
kubectl apply -f ruler.yaml 
