FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app/preschool

# Copy pom.xml and src directory
COPY pom.xml ./
COPY src/ ./src/

# Copy the frontend build output (dist) to Spring Boot static directory
COPY src/ ./src/main/resources/static/

# Run Maven clean package, specify the goals here
RUN mvn clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/preschool-0.0.1-SNAPSHOT.jar"]


