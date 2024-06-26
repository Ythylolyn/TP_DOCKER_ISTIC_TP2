FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -f libpng16-16

COPY myapp/ /app
WORKDIR /app
RUN  mvn install:install-file -Dfile=./lib/opencv-3410.jar -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN  mvn package
EXPOSE 8080

CMD  java -Djava.library.path=/app/lib/ubuntuupperthan18/ -jar  /app/target/fatjar-0.0.1-SNAPSHOT.jar