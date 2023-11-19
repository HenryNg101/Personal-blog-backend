# Use an official OpenJDK runtime as a base image
FROM openjdk:21-oracle

# Install xargs
RUN microdnf install findutils

# Set the working directory
WORKDIR /app

# Copy the local build context (current directory) into the container at /app
COPY . /app

# Build the application with gradle
RUN ./gradlew clean build --no-daemon

# Specify the JAR file name
ARG JAR_FILE=build/libs/personal-blogs-backend-0.0.1-SNAPSHOT.jar

# Copy the JAR file into the container at /app
COPY ${JAR_FILE} /app/app.jar

# Specify the command to run on container start
CMD ["java", "-jar", "app.jar"]
