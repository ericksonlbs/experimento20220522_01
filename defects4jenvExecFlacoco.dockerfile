ARG JAVA_VERSION=8
FROM defects4jenv:java${JAVA_VERSION}
#image name defects4jenvexec:java8_flacoco

# Download Flacoco
RUN cd / && \ 
     git clone https://github.com/SpoonLabs/flacoco

# Install Flacoco
RUN cd /flacoco && \
     mvn install -DskipTests

# Define workdir
WORKDIR /flacoco/target/

CMD ["java", "-jar", "flacoco-1.0.3-jar-with-dependencies.jar"]