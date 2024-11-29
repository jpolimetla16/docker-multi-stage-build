FROM maven:3.8.2-openjdk-17-slim as test
WORKDIR /app
COPY pom.xml .
COPY src /app/src
RUN mvn clean test

FROM maven:3.8.2-openjdk-17-slim  as build
WORKDIR /app
COPY pom.xml .
COPY src /app/src
RUN mvn clean package -DskipTests


FROM openjdk:17-alpine as prod
WORKDIR /app
COPY --from=build /app/target/*.jar /app/test.jar
EXPOSE 8181
ENTRYPOINT [ "java","-jar","test.jar" ]