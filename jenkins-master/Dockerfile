# Starting off with the Jenkins base Image
FROM jenkins/jenkins:lts

MAINTAINER vitalcode

USER root

# Installing packages to allow apt to use a repository over HTTPS:
RUN apt-get update && \
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

# Installing the latest version of Docker CE and containerd
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update && \
    apt-get -y --allow-unauthenticated install \
        docker-ce \
        docker-ce-cli \
        containerd.io

# Installing the plugins we need using the in-built install-plugins.sh script
RUN /usr/local/bin/install-plugins.sh \
    cloudbees-folder \
    ntisamy-markup-formatter \
    git \
    ant \
    gradle \
    matrix-auth \
    workflow-aggregator \
    github-branch-source \
    pipeline-github-lib \
    pipeline-stage-view \
    docker-workflow \
    blueocean \
    credentials-binding \
    email-ext \
    mailer \
    build-timeout \
    timestamper \
    ws-cleanup

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Start-up scripts to set number of executors and creating the admin user
COPY tools/executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY tools/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

USER ${user}

VOLUME /var/jenkins_home