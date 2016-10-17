# docker-kiwi-jenkins

## docs
https://hub.docker.com/_/jenkins/

## Build
```
docker build --rm -t yren/kiwi-jenkins .
docker tag yren/kiwi-jenkins yren/kiwi-jenkins:0.1
```

## Push to docker hub
```
# login docker hub
docker login
# push image
docker push yren/kiwi-jenkins:0.1
```