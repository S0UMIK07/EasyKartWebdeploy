
# Stage 1: Build the application
FROM maven:3.8.5-openjdk-18 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:18-ea-8-jdk-slim
WORKDIR /app
COPY --from=build /target/mycart-1.0-SNAPSHOT.jar mycart.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar", "mycart.jar"]
