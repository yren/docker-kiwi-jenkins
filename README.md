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

## Pull image
```
docker pull yren/kiwi-jenkins:0.1
```

## start container
```
sudo mkdir -p /rt/jenkins_home
sudo chmod -R 777 /rt/jenkins_home
HOST_J_HOME="/rt/jenkins_home"
```

```
docker run -d --name="jenkins" \
-p 8080:8080 -p 60000:50000 \
--restart=always \
-v $HOST_J_HOME:/var/jenkins_home/ \
-v /var/run/docker.sock:/var/run/docker.sock \
-e "HOST_J_HOME=${HOST_J_HOME}" \
yren/kiwi-jenkins:0.1
```

## jenkins security
* Manage Jenkins - Configure Global Security - check 'Enable Security', select 'Jenkins own database', check 'Allow user to sign up'
* sign up a user
* user 'Matrix based security'
