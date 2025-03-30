# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper files (if present)
COPY .mvn .mvn
COPY mvnw pom.xml ./

# Give execution permission to Maven wrapper (if needed)
RUN chmod +x mvnw

# Run Maven to build the project
RUN ./mvnw clean package -DskipTests

# Copy the built JAR file to the container
COPY target/*.jar app.jar

# Expose the application port (change if needed)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
