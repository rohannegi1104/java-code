# Use OpenJDK 17 as the base image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Copy the Java source file into the container
COPY Test.java .

# Compile the Java file
RUN javac Test.java

# Run the Java program and keep the container alive
CMD ["sh", "-c", "java Test && tail -f /dev/null"]
