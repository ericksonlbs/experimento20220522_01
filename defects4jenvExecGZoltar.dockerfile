ARG JAVA_VERSION=8
FROM defects4jenv:java${JAVA_VERSION}
#image name defects4jenvexec:java8_gzoltar

# Download GZoltar
RUN cd / && \
    git clone https://github.com/GZoltar/gzoltar

# Install GZoltar
RUN cd /gzoltar && mvn clean install -Dgpg.skip=true

# Define workdir
WORKDIR /gzoltar/com.gzoltar.cli/target

CMD ["java", "-jar", "com.gzoltar.cli-1.7.4-SNAPSHOT-jar-with-dependencies.jar"]