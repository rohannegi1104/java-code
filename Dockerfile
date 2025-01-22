FROM openjdk:17
WORKDIR /app
COPY Test.java .
RUN javac Test.java
CMD ["java", "Test"]
EXPOSE 8080
