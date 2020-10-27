FROM ubuntu
RUN apt-get update
RUN apt-get install openjdk-8-jdk -y
RUN mkdir -p /opt/app
ENV PROJECT_HOME=/opt/app
COPY target/spring-boot-rest.jar ${PROJECT_HOME}/spring-boot-rest.jar
WORKDIR ${PROJECT_HOME}
CMD ["java","-jar","spring-boot-rest.jar"]