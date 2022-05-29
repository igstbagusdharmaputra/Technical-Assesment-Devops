FROM maven:3.8.4-jdk-11-slim AS build

WORKDIR /app 

COPY . .

RUN mvn clean package

FROM openjdk:11-jdk-slim-buster

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]