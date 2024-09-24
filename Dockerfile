FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app/preschool

# Copy pom.xml and src directory
COPY preschool/pom.xml ./ 
COPY preschool/src/ ./src/

# Run Maven clean package, specify the goals here
RUN mvn clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/preschool-0.0.1-SNAPSHOT.jar"]

