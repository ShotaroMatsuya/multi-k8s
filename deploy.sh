docker build -t shotaromatsuya/multi-client-k8s:latest -t shotaromatsuya/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t shotaromatsuya/multi-server-k8s:latest -t shotaromatsuya/multi-server-k8s:$SHA -f ./server/Dockerfile ./server
docker build -t shotaromatsuya/multi-worker-k8s:latest -t shotaromatsuya/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker
dokcer push shotaromatsuya/multi-clien-k8st:latest
dokcer push shotaromatsuya/multi-server-k8s:latest
dokcer push shotaromatsuya/multi-worker-k8s:latest
dokcer push shotaromatsuya/multi-client-k8s:$SHA
dokcer push shotaromatsuya/multi-server-k8s:$SHA
dokcer push shotaromatsuya/multi-worker-k8s:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=shotaromatsuya/multi-server-k8s:$SHA
kubectl set image deployments/client-deployment client=shotaromatsuya/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=shotaromatsuya/multi-worker-k8s:$SHA