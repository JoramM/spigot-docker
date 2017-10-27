#!/bin/sh

if [ -f BuildTools.jar ]
then
  echo starting Minecraft Server
  echo =========================
  java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-1.12.2.jar
else
  echo start to build Spigot
  echo =====================
  wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  java -jar BuildTools.jar --rev latest
  echo
  echo =========================
  echo starting Minecraft Server
  echo =========================
  java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-1.12.2.jar
fi

# /bin/bash
