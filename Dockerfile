# Fase de construção
FROM maven:3.8.4-openjdk-21 AS build

WORKDIR /app
COPY . .

RUN mvn clean install

# Fase final
FROM openjdk:21-jdk-slim

WORKDIR /app
EXPOSE 8080

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
