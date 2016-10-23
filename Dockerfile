FROM jenkins:1.625.2
MAINTAINER Yufei <renyufei@gmail.com>

# Install docker
User root
RUN set -x; \
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
  && apt-get update \
  && apt-get install -y apt-transport-https \
  && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y docker-engine 

RUN set -x; \
  usermod -a -G docker jenkins

User jenkins

# Install plugins
COPY data/plugins.txt /usr/share/jenkins/ref/plugins.txt
# set jenkins executor number
COPY data/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
RUN set -x; \
  /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
