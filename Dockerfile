FROM openjdk:17-jdk-slim
COPY target/spring-boot-github-action-demo.jar spring-boot-github-action-demo.jar
EXPOSE 8080
RUN mkdir -p /usr/local/newrelic
ADD ./newrelic/newrelic.jar /usr/local/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /usr/local/newrelic/newrelic.yml
ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","/spring-boot-github-action-demo.jar"]


