# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim  

# Install Maven
RUN apt update && apt install -y maven  

# Set the working directory
WORKDIR /app  

# Copy all project files into the container
COPY . .  

# Build the project using Maven
RUN mvn clean package -DskipTests  

# Run the generated JAR file
CMD ["java", "-jar", "target/*.jar"]
