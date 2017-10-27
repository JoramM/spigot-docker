FROM openjdk:8

RUN apt-get -y update && \
    apt-get -y install git nano

RUN mkdir minecraft

WORKDIR /minecraft

# RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# RUN git config --global --unset core.autocrlf &&\
#     java -jar BuildTools.jar --rev latest
# RUN java -jar BuildTools.jar --rev latest

ADD includes/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
