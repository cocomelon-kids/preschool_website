FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app/preschool

# Copy pom.xml and src directory
COPY preschool/pom.xml ./
COPY preschool/src/ ./src/

RUN mvn --version

# Run Maven clean and package
RUN mvn clean package -DskipTests 

