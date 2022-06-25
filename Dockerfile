FROM maven:3.6-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn package

FROM openjdk:11.0.1-jre-slim-stretch
EXPOSE 9090
WORKDIR /app
#ARG JAR=spring-petclinic-2.7.0-SNAPSHOT.jar

COPY --from=BUILD /src/target/*.jar ./app.jar
ENTRYPOINT ["java","-jar","./app.jar","--server.port=","9090"]







