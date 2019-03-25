#
# Scala and sbt Dockerfile
#
# https://github.com/tkrs/docker-sbt
#

# Pull base image
FROM tkrs/openjdk-debian:12

# Env variables
ENV SCALA_VERSION 2.12.8
ENV SBT_VERSION   1.2.8

# Scala expects this file
RUN \
  touch /usr/lib/jvm/openjdk12/release && \
  curl -L -sSo "sbt-$SBT_VERSION.deb" "https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb" && \
  dpkg -i "sbt-$SBT_VERSION.deb" && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install --no-install-recommends sbt && \
  sbt sbtVersion

# Define working directory
WORKDIR /root
