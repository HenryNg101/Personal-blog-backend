# Stage 1: Build Stage
# Use an official OpenJDK runtime as a base image
FROM openjdk:21-oracle AS build
# Install xargs
RUN microdnf install findutils
# Set the working directory
WORKDIR /app
# Copy the local build context (current directory) into the container
COPY . .
# Build the application with gradle
RUN ./gradlew clean build

# Stage 2: Production Stage (Only retain and use necessary stuff from stage 1)
# Use the same official OpenJDK runtime as base image, again
FROM openjdk:21-oracle
WORKDIR /app
# Copy output jar file from previous stage to current one.
COPY --from=build /app/build/libs/personal-blogs-backend-0.0.1-SNAPSHOT.jar /app/app.jar
CMD ["java", "-jar", "app.jar"]
