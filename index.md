# RTSP AWS CLI Docker Image

Debian with AWS CLI included.


## Usage


### Run Once

```ShellSession
docker run --rm -it rtsp/aws-cli bash
```


### Run as Daemon

```ShellSession
docker run -d --name rtsp-aws-cli rtsp/aws-cli
docker exec -it rtsp-aws-cli bash
```


### Kubernetes Pod

```ShellSession
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: aws-cli
spec:
  containers:
  - name: aws-cli
    image: rtsp/aws-cli:latest
EOF
kubectl exec -it aws-cli -- bash
```


## Links

- [Docker Hub: rtsp/aws-cli](https://hub.docker.com/r/rtsp/aws-cli)
- [GitHub: rtsp/docker-aws-cli](https://github.com/rtsp/docker-aws-cli)
