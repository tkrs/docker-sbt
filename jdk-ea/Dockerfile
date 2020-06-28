FROM openjdk:15-ea-buster

ENV SBT_VERSION 1.3.13

RUN curl -L -sSo "sbt-$SBT_VERSION.deb" "https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb" && \
  dpkg -i "sbt-$SBT_VERSION.deb" && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get -qq update && \
  apt-get -qq install --no-install-recommends sbt && \
  apt-get -qq autoremove && \
  sbt sbtVersion

WORKDIR /root
