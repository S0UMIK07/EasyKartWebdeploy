
FROM maven:3.8.5-openjdk-18 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:18-ea-8-jdk-slim
COPY --from=build /target/mycart-1.0-SNAPSHOT.jar mycart.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","mycart.jar"]