ARG DOCKER_URL
ARG DOCKER_ORG

FROM ${DOCKER_URL}/${DOCKER_ORG}/common-img:latest

# Custom build from here on
ENV PROJECT_NAME HikariCP

COPY --chown=build:build src src
COPY --chown=build:build pom.xml pom.xml



ARG BUILD_ID

RUN set -e &&\
    mvn versions:set -DnewVersion=5.0.1-${BUILD_ID} &&\
    mvn versions:commit &&\
    mvn clean package -DskipTests &&\
    cp pom.xml /dist/release-libs/${PROJECT_NAME}-5.0.1-${BUILD_ID}.jar.pom.xml &&\
    cp target/${PROJECT_NAME}-5.0.1-${BUILD_ID}.jar /dist/release-libs/${PROJECT_NAME}-5.0.1-${BUILD_ID}.jar &&\
    ls -la target &&\
    rm -rf ~/.m2/repository


RUN cat pom.xml
