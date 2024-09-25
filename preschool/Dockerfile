# Stage 1: Build the backend with Maven
FROM maven:3.8.3-openjdk-17 AS backend-build

WORKDIR /app/preschool

# Copy the backend pom.xml and source code
COPY backend/pom.xml ./
COPY backend/src/ ./src/

# Run Maven to build the backend (skip tests for faster builds)
RUN mvn clean package -DskipTests

# Stage 2: Run the backend application
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the Spring Boot JAR from the build stage
COPY --from=backend-build /app/preschool/target/preschool-0.0.1-SNAPSHOT.jar ./preschool.jar

# Expose the port your Spring Boot application runs on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "preschool.jar"]


