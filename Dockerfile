FROM openjdk:8-jre

# Defines env variables
# REV is the version to build. see: https://www.spigotmc.org/wiki/buildtools/#versions 
ARG REV=1.13.2

# Installs git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Sets `/spigot` as work dir
WORKDIR /spigot

# Gets BuildTools.jar
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Runs BuildTools.jar
RUN java -Xmx1024M -jar BuildTools.jar --rev ${REV}

# Makes a server directory and moves `spigot.jar`.
RUN mkdir /server
RUN mv spigot-${REV}.jar /server/spigot.jar

# Sets `/server` as work dir
WORKDIR /server

# Creates /server/eula.txt
RUN touch eula.txt
RUN echo "eula=true" > eula.txt

# Starts Spigot
ENTRYPOINT ["java", "-Xms1G", "-Xmx1G", "-XX:+UseConcMarkSweepGC", "-jar", "spigot.jar"] 
