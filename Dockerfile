<<<<<<< HEAD
FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app/preschool

# Copy pom.xml and src directory
COPY preschool/pom.xml ./ 
COPY preschool/src/ ./src/

# Run Maven clean package, specify the goals here
RUN mvn clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/preschool-0.0.1-SNAPSHOT.jar"]

=======
# Stage 1: Build the frontend
FROM node:18 AS frontend-build

WORKDIR /app

# Copy frontend package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install dependencies for the frontend
RUN npm install

# Copy the rest of the frontend source code and build it
COPY ./src ./src
RUN npm run build

# Stage 2: Build the backend and copy the frontend dist into Spring Boot
FROM maven:3.8.3-openjdk-17 AS backend-build

WORKDIR /app/preschool

# Copy the backend pom.xml and source code
COPY preschool/pom.xml ./
COPY preschool/src/ ./src/

# Copy the frontend build output from the previous stage
COPY --from=frontend-build /app/dist/ ./src/main/resources/static/

# Run Maven to build the backend
RUN mvn clean package -DskipTests

# Stage 3: Run the backend application
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the Spring Boot JAR from the build stage
COPY --from=backend-build /app/preschool/target/preschool-0.0.1-SNAPSHOT.jar ./preschool.jar

# Run the Spring Boot application
CMD ["java", "-jar", "preschool.jar"]
>>>>>>> f8c8ea9 (first commit)
