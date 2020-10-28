FROM openjdk:8-alpine
RUN apk update
RUN mkdir -p /opt/app
ENV PROJECT_HOME=/opt/app
COPY target/spring-boot-rest.jar ${PROJECT_HOME}/spring-boot-rest.jar
WORKDIR ${PROJECT_HOME}
CMD ["java","-jar","spring-boot-rest.jar"]