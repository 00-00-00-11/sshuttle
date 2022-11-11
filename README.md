# sshuttle: where transparent proxy meets VPN meets ssh

Original software: https://github.com/sshuttle/sshuttle

This repository is made to Dockerize sshuttle and run it via docker-compose.

## How it works
Let's assume we have a `SERVER` which is behind the firewall and we want to route all it's traffic through `JUMP SERVER`

### First of all create a `docker-compose.yml`, e.g.:
ON YOUR SERVER WHICH IS BEHIND THE FIREWALL
```sh
cd /
mkdir service.sshuttle
cd service.sshuttle
vim docker-compose.yml
%PASTE DOCKER COMPOSE FILE CONTENT FROM THIS REPOSITORY%
```

### Now generate ssh-key
ON YOUR SERVER WHICH IS BEHIND THE FIREWALL
```sh
mkdir ssh-key
ssh-keygen -t rsa -f /service.sshuttle/ssh-key -q -P ""
```

> This ssh-key is needed to connect to your JUMP SERVER where all traffic will be routed through, we will authenticate by PublicKeyAuthentication

### Add public key to `authorized_keys` file
ON YOUR JUMP SERVER
```sh
vim ~/.ssh/authorized_keys
%PASTE id_rsa.pub CONTENT%
```

## How to use it
```sh
cd /service.sshuttle
docker-compose up -d
```