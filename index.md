# RTSP AWS CLI Docker Image

Debian with [AWS CLI](https://github.com/aws/aws-cli/tree/v2) included.


## Usage

In order to use image from GitHub Container Registry instead of Docker Hub, you can replace `rtsp/aws-cli` with `ghcr.io/rtsp/docker-aws-cli` anywhere in the instruction below.

### Pull Image

```ShellSession
docker pull rtsp/aws-cli
```

### Interactive Mode

```ShellSession
docker run --rm -it rtsp/aws-cli bash
```

```ShellSession
docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=AKIAXXXX \
  -e AWS_SECRET_ACCESS_KEY=XXXX \
  -e AWS_DEFAULT_REGION=ap-southeast-1 \
  rtsp/aws-cli bash
```

#### Run Once

```ShellSession
docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=AKIAXXXX \
  -e AWS_SECRET_ACCESS_KEY=XXXX \
  -e AWS_DEFAULT_REGION=ap-southeast-1 \
  rtsp/aws-cli aws s3 ls
```

### Run as Daemon

```ShellSession
docker run -d --name aws-cli \
  -e AWS_ACCESS_KEY_ID=AKIAXXXX \
  -e AWS_SECRET_ACCESS_KEY=XXXX \
  -e AWS_DEFAULT_REGION=ap-southeast-1 \
  rtsp/aws-cli
```

```ShellSession
docker exec -it aws-cli aws s3 ls

docker exec -it aws-cli bash
```

WARNING: This will leave your keys in the running container.

### Run as Kubernetes Pod

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: aws-cli
spec:
  containers:
  - name: aws-cli
    image: rtsp/aws-cli:latest
    env:
    - name: AWS_ACCESS_KEY_ID
      value: AKIAXXXX
    - name: AWS_SECRET_ACCESS_KEY
      value: XXXX
    - name: AWS_DEFAULT_REGION
      value: ap-southeast-1
```

```ShellSession
kubectl exec -it aws-cli -- aws s3 ls

kubectl exec -it aws-cli -- bash
```

WARNING: This will leave your keys in the running pod.


## Links

### Packages

- Docker Hub: [rtsp/aws-cli](https://hub.docker.com/r/rtsp/aws-cli/)
- GitHub: [ghcr.io/rtsp/docker-aws-cli](https://github.com/rtsp/docker-aws-cli/pkgs/container/docker-aws-cli)

### Source Code

- [rtsp/docker-aws-cli](https://github.com/rtsp/docker-aws-cli)
