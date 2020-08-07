FROM arm32v7/openjdk:10-jre

ENV HOME /var/jenkins_home

RUN addgroup --system jenkins
RUN adduser --system --home $HOME --ingroup jenkins jenkins

ADD jenkins-jnlp.sh /usr/share/jenkins/jenkins-jnlp.sh
ADD https://jenkins.iogames.de/jnlpJars/agent.jar /usr/share/jenkins/agent.jar

RUN chown jenkins:jenkins /usr/share/jenkins/agent.jar

WORKDIR /home/jenkins

USER jenkins

ENTRYPOINT ["/usr/share/jenkins/jenkins-jnlp.sh"]
#ENTRYPOINT ["/bin/sh", "-c"]
