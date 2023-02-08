FROM openjdk:17
LABEL maintainer="jean.denis.rafenoarisoa@gmail.com"
ADD /target/config-0.0.1-SNAPSHOT.jar /home/config-server-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/home/config-server-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=prod"]