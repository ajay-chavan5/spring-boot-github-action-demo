FROM openjdk:17-jdk-slim
WORKDIR /opt/newrelic/newrelic/
COPY target/spring-boot-github-action-demo.jar spring-boot-github-action-demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","/spring-boot-github-action-demo.jar"]

RUN sudo mkdir -p /usr/local/newrelic
ADD ./newrelic.jar /usr/local/newrelic/newrelic.jar
ADD ./newrelic.yml /usr/local/newrelic/newrelic.yml
