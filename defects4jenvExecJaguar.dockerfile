ARG JAVA_VERSION=8
FROM defects4jenv:JAVA${JAVA_VERSION}
#image name defects4jenvexec:jaguar
# Download Jaguar
RUN git clone https://github.com/SIN5005-EngSoft2021/jaguar

# Install Jaguar
RUN cd jaguar && \
     mvn install:install-file -Dfile=br.usp.each.saeg.jaguar.core/lib/org.jacoco.core-0.7.6.jar \
     -DgroupId=br.usp.each.saeg -DartifactId=org.jacoco.core \
     -Dversion=0.7.6 -Dpackaging=jar && \
     mvn install -pl br.usp.each.saeg.jaguar.core -am

# Define workdir
WORKDIR /jaguar/br.usp.each.saeg.jaguar.core/target/

CMD ["java", "-jar", "br.usp.each.saeg.jaguar.core-1.0.0-jar-with-dependencies.jar"]