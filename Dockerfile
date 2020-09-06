FROM acrelle/rpi-dind-jenkins-slave:latest

RUN apt-get update && \
    apt-get install -y python python-pip && \
    pip install awscli && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

ENV HOME /var/jenkins_home

ADD jenkins-jnlp.sh /usr/share/jenkins/jenkins-jnlp.sh

RUN chown jenkins:jenkins /usr/share/jenkins/jenkins-jnlp.sh
RUN chmod +x /usr/share/jenkins/jenkins-jnlp.sh

ADD https://jenkins.iogames.de/jnlpJars/agent.jar /usr/share/jenkins/agent.jar

RUN chown jenkins:jenkins /usr/share/jenkins/agent.jar

WORKDIR /home/jenkins

ENTRYPOINT ["/usr/share/jenkins/jenkins-jnlp.sh"]
