#arguments
ARG PROJECT=Lang
ARG BUG=1
ARG EXEC=Jaguar
ARG JAVA_VERSION=8

FROM defects4jenvexec:java${JAVA_VERSION}_${EXEC}
#image name defects4jenvexecdefect:java${JAVA_VERSION}_${EXEC}_${PROJECT}_${DEFECT}

# Get Project
RUN cd /defects4j/framework/bin && \
    defects4j checkout -p ${PROJECT} -v ${BUG}b -w /tmp/${PROJECT}_${BUG}

# Install project test
RUN cd /tmp/${PROJECT}_${BUG} && mvn clean install -DskipTests

#copy script to run
COPY ./exec/${EXEC}_exec.sh /tmp/${EXEC}_exec.sh

#define default workdir 
WORKDIR /tmp

#exec script
CMD ["sh", "${EXEC}_exec.sh"]