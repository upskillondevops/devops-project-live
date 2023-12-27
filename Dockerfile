# Use an official OpenJDK runtime as a base image
# FROM adoptopenjdk:11-jre-hotspot

# LABEL costcentre="Control"

# # Set the working directory to /app
# WORKDIR /app

# # Copy the JAR file into the container at /app
# COPY --from=build target/*.jar /app/app.jar

# # Expose port 8080
# EXPOSE 8080

# # Run the application when the container launches
# CMD ["java", "-jar", "app.jar"]
# Stage 1: Build stage
FROM maven:latest AS build

WORKDIR /app

# Copy the source code into the build image
COPY . .

# Build the application
RUN mvn clean install -DskipTests

# Stage 2: Production stage
#FROM adoptopenjdk:latest
FROM meddream/jdk17:latest

WORKDIR /app

# Copy the JAR file from the build stage into the production image
COPY --from=build /app/target/*.jar /app/app.jar

# Expose port 8080
EXPOSE 8080

# Run the application when the container launches
CMD ["java", "-jar", "app.jar"]
