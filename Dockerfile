FROM jenkins:1.625.2
MAINTAINER Yufei <renyufei@gmail.com>

# Install docker
User root
RUN set -x; \
  apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN set -x; \
  groupadd -g 497 docker \
  && usermod -a -G docker jenkins

ADD data/docker/docker-1.11.2.tgz /usr/bin/

User jenkins

# Install plugins
COPY data/plugins.txt /usr/share/jenkins/ref/plugins.txt
# set jenkins executor number
COPY data/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
RUN set -x; \
  /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
