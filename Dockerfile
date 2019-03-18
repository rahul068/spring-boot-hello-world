FROM openjdk:8-jdk-alpine

MAINTAINER "Rahul Jaiswal<rahul.jaiswal@walmart.com>"

#CREATE SSH
RUN apk add --no-cache --update openssh \
	&& apk add --no-cache --update openrc \
	&& apk add --no-cache --update curl \
	&& rc-update add sshd \
        && chpasswd $rootuser

ADD target/spring-boot-hello-world-1.0-SNAPSHOT.jar app.jar

#Expose port
EXPOSE 8000

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]