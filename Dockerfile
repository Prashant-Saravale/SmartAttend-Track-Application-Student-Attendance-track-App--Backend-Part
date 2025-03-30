# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory in the container
WORKDIR /app

# Copy the built JAR file (Change "your-app.jar" to your actual JAR name)
COPY target/*.jar app.jar

# Expose the application's port (change if needed)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
