# RTSP AWS CLI Docker Image

Debian with [AWS CLI](https://github.com/aws/aws-cli/tree/v2) included.


## `aws` Usage

For the `aws` command usage, please refer to the following documents.

- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [AWS CLI v2 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)
  - [`aws ec2` Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/index.html)
  - [`aws s3` Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/index.html)
  - [`aws iam` Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/iam/index.html)
  - [`aws ecs` Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ecs/index.html)
  - [`aws eks` Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/eks/index.html)


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

### Run a Specific Command

```ShellSession
docker run --rm \
  -e AWS_ACCESS_KEY_ID=AKIAXXXX \
  -e AWS_SECRET_ACCESS_KEY=XXXX \
  -e AWS_DEFAULT_REGION=ap-southeast-1 \
  rtsp/aws-cli aws s3 ls
```

### Run as Daemon

WARNING: This will leave your keys in the running container.

```ShellSession
docker run -d --name aws-cli \
  -e AWS_ACCESS_KEY_ID=AKIAXXXX \
  -e AWS_SECRET_ACCESS_KEY=XXXX \
  -e AWS_DEFAULT_REGION=ap-southeast-1 \
  rtsp/aws-cli
```

```ShellSession
docker exec aws-cli aws s3 ls

docker exec -it aws-cli bash
```

### Run as Kubernetes Pod

WARNING: This will leave your keys in the running pod.

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
kubectl exec aws-cli -- aws s3 ls

kubectl exec -it aws-cli -- bash
```

### Run as Kubernetes Deployment

WARNING: This will leave your keys in the running pod.

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: aws-cli
spec:
  replicas: 1
  selector:
    matchLabels:
      name: aws-cli
  template:
    metadata:
      labels:
        name: aws-cli
    spec:
      containers:
        - name: aws-cli
          image: rtsp/aws-cli:latest
          imagePullPolicy: Always
          env:
          - name: AWS_ACCESS_KEY_ID
            value: AKIAXXXX
          - name: AWS_SECRET_ACCESS_KEY
            value: XXXX
          - name: AWS_DEFAULT_REGION
            value: ap-southeast-1
```

```ShellSession
kubectl exec deployment/aws-cli -- aws s3 ls

kubectl exec -it deployment/aws-cli -- bash
```


## Links

### Packages

- Docker Hub: [rtsp/aws-cli](https://hub.docker.com/r/rtsp/aws-cli/)
- GitHub: [ghcr.io/rtsp/docker-aws-cli](https://github.com/rtsp/docker-aws-cli/pkgs/container/docker-aws-cli)

### Source Code

- [rtsp/docker-aws-cli](https://github.com/rtsp/docker-aws-cli)
