FROM openjdk:11.0-jdk
ADD /target/yourstore-ms-store.jar /
EXPOSE 8014
RUN apt-get update
RUN apt-get install dos2unix

ADD  s_start.sh /
RUN dos2unix s_start.sh 
RUN chmod +x /s_start.sh
CMD cd / && ./s_start.sh
