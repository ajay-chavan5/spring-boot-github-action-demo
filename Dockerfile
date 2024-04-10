FROM openjdk:17-jdk-slim
COPY target/spring-boot-github-action-demo.jar spring-boot-github-action-demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","/spring-boot-github-action-demo.jar"]

RUN mkdir -p /usr/local/newrelic
ADD /opt/newrelic/newrelic/newrelic.jar /usr/local/newrelic/newrelic.jar
ADD /opt/newrelic/newrelic/newrelic.yml /usr/local/newrelic/newrelic.yml
