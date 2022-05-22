ARG JAVA_VERSION=8
FROM defects4jenv:JAVA${JAVA_VERSION}
#image name defects4jenvexec:jaguar

# Download Flacoco
RUN git clone https://github.com/SpoonLabs/flacoco

# Install Flacoco
RUN cd flacoco && \
     mvn install

# Define workdir
WORKDIR /flacoco/target/

CMD ["java", "-jar", "flacoco-1.0.3-jar-with-dependencies.jar"]