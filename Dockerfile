FROM ubuntu:22.04
RUN apt update
RUN apt upgrade -y
RUN apt install openjdk-17-jre-headless -y
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
