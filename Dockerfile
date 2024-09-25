# Stage 1: Build the frontend
FROM node:18 AS frontend-build

WORKDIR /app/frontend

# Copy frontend package.json and package-lock.json files from the frontend folder
COPY frontend/package.json frontend/package-lock.json ./

# Install dependencies for the frontend
RUN npm install

# Copy the rest of the frontend source code and build it
COPY frontend/src ./src
RUN npm run build

# Stage 2: Build the backend and copy the frontend dist into Spring Boot
FROM maven:3.8.3-openjdk-17 AS backend-build

WORKDIR /app/preschool

# Copy the backend pom.xml and source code
COPY preschool/pom.xml ./
COPY preschool/src/ ./src/

# Copy the frontend build output from the previous stage into the Spring Boot static folder
COPY --from=frontend-build /app/frontend/dist/ ./src/main/resources/static/

# Run Maven to build the backend
RUN mvn clean package -DskipTests

# Stage 3: Run the backend application
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the Spring Boot JAR from the build stage
COPY --from=backend-build /app/preschool/target/preschool-0.0.1-SNAPSHOT.jar ./preschool.jar

# Run the Spring Boot application
CMD ["java", "-jar", "preschool.jar"]
