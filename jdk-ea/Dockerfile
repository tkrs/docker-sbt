FROM openjdk:12-ea-jdk-alpine

ENV SCALA_VERSION 2.12.8
ENV SBT_VERSION 1.2.7
ENV PATH /usr/local/scala-${SCALA_VERSION}/bin:/usr/local/sbt/bin:${PATH}

RUN \
  apk add --update --no-cache curl bash && \
  mkdir -p /usr/local/scala-${SCALA_VERSION}/ && \
  curl -q -o - -L https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz | tar xzf - -C /usr/local/ && \
  curl -fsL https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz | tar xfz - -C /usr/local/ && \
  sbt sbtVersion && \
  mkdir project && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" > build.sbt && \
  echo "sbt.version=${SBT_VERSION}" > project/build.properties && \
  echo "case object Temp" > Temp.scala && \
  sbt compile && \
  rm -r project && rm build.sbt && rm Temp.scala && rm -r target

WORKDIR /root
