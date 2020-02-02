kubectl label nodes ansible-3  dedicated=cortex
kubectl label nodes ansible-4  dedicated=cortex

kubectl taint nodes ansible-3 dedicated=cortex:NoSchedule
kubectl taint nodes ansible-4 dedicated=cortex:NoSchedule

#Remove label
kubectl label nodes ansible-3  dedicated-

#Remove taint
kubectl taint nodes ansible-3  dedicated:NoSchedule-

kubectl patch node ansible-4  -p '{"spec":{"taints":[]}}'
kubectl patch node ansible-3  -p '{"spec":{"taints":[]}}'

#For table manager
kubectl create secret generic cortex-aws-creds  --from-literal=USER_NAME=dummy --from-literal=USER_PASSWORD=user --from-literal=AWS_DEFAULT_REGION=pass

kubectl port-forward $(kubectl  get pods -l "cortex=dynamodb" -o jsonpath='{.items[0].metadata.name}') 9090:8000 AWS_ACCESS_KEY_ID=user AWS_SECRET_ACCESS_KEY=pass AWS_DEFAULT_REGION=dummy aws --endpoint-url http://127.0.0.1:9090 dynamodb list-tables


AWS_ACCESS_KEY_ID=user AWS_SECRET_ACCESS_KEY=pass AWS_DEFAULT_REGION=dummy aws --endpoint-url http://127.0.0.1:9090 dynamodb scan --table-name cortex_chunks_2611


For casandra
kubectl  exec -it $(kubectl get pod   -l app=cortex-cassandra  -o jsonpath={.items..metadata.name}) cqlsh

desc keyspaces
desc tables

# for single node casandra set the replication to one

ALTER KEYSPACE cortex  WITH replication = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

