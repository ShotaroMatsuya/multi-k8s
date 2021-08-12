docker build -t shotaromatsuya/multi-client:latest -t shotaromatsuya/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shotaromatsuya/multi-server:latest -t shotaromatsuya/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shotaromatsuya/multi-worker:latest -t shotaromatsuya/multi-worker:$SHA -f ./worker/Dockerfile ./worker
dokcer push shotaromatsuya/multi-client:latest
dokcer push shotaromatsuya/multi-server:latest
dokcer push shotaromatsuya/multi-worker:latest
dokcer push shotaromatsuya/multi-client:$SHA
dokcer push shotaromatsuya/multi-server:$SHA
dokcer push shotaromatsuya/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=shotaromatsuya/multi-server:$SHA
kubectl set image deployments/client-deployment client=shotaromatsuya/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=shotaromatsuya/multi-worker:$SHA