# Stage 1: Build the frontend
FROM node:18 AS frontend-build

WORKDIR /app/frontend

# Copy frontend package.json and package-lock.json files
COPY frontend/package.json frontend/package-lock.json ./

# Install dependencies for the frontend
RUN npm install

# Copy the rest of the frontend source code and build it
COPY frontend/ ./

# Run the build process (this will generate the dist folder)
RUN npm run build

# Stage 2: Build the backend with Maven
FROM maven:3.8.3-openjdk-17 AS backend-build

WORKDIR /app/preschool

# Copy the backend pom.xml and source code
COPY preschool/pom.xml ./
COPY preschool/src/ ./src/

# Run Maven to build the backend (skip tests for faster builds)
RUN mvn clean package -DskipTests

# Stage 3: Set up Nginx to serve the frontend
FROM nginx:alpine AS frontend-server

# Copy the build output to the Nginx html folder
COPY --from=frontend-build /app/frontend/dist /usr/share/nginx/html

# Expose the port Nginx will run on
EXPOSE 80

# Stage 4: Run the backend application
FROM openjdk:17-jdk-slim AS backend-server

WORKDIR /app

# Copy the Spring Boot JAR from the build stage
COPY --from=backend-build /app/preschool/target/preschool-0.0.1-SNAPSHOT.jar ./preschool.jar

# Expose the port your Spring Boot application runs on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "preschool.jar"]
