
FROM maven:3.8.5-openjdk-18 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:18-ea-8-jdk-slim
COPY --from=build /target/mycart-0.0.1-SNAPSHOT.jar mycart.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","mycart.jar"]