#build step
FROM gradle:jdk8-alpine as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

#run step
FROM openjdk:8-jdk-alpine
EXPOSE 8080
COPY --from=builder /home/gradle/src/build/libs/sample-app-0.0.1-SNAPSHOT.jar /
CMD java -jar /sample-app-0.0.1-SNAPSHOT.jar

