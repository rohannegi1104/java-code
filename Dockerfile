FROM openjdk:17
WORKDIR /app
COPY Test.java .
RUN javac Test.java
CMD ["sh", "-c", "java Test && sleep 3600"]
EXPOSE 80
