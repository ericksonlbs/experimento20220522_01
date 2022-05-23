#arguments
ARG JAVA_VERSION=8
ARG EXEC=jaguar

FROM defects4jenvexec:java${JAVA_VERSION}_${EXEC}
#image name defects4jenvexecdefect:java${JAVA_VERSION}_${EXEC}_${PROJECT}_${DEFECT}

ARG POM=pom.xml
ARG BUG=1
ARG PROJECT=Lang
ARG EXEC=jaguar

ENV PROJECT=${PROJECT}
ENV BUG=${BUG}
ENV EXEC=${EXEC}

# Get Project
RUN cd /defects4j/framework/bin && \
    export PATH=$PATH:/defects4j/framework/bin && \
    defects4j checkout -p ${PROJECT} -v ${BUG}b -w /tmp/test

#copy script to run
COPY ./exec/${EXEC}.sh /tmp/exec.sh

# Install project test
RUN cd /tmp/test && \
    mvn install -f ${POM} -Dmaven.test.failure.ignore=true
#/defects4j/framework/bin/defects4j compile

#define default workdir 
WORKDIR /tmp

#exec script
CMD ["sh", "exec.sh", "/tmp/test"]