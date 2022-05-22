#arguments
ARG PROJECT=Lang
ARG DEFECT=1
ARG EXEC=Jaguar

FROM defects4jenvexec:${EXEC}
#image name defects4jenvexecdefect:${EXEC}_${PROJECT}_${DEFECT}

# Get Project
RUN cd /defects4j/framework/bin && \
    defects4j checkout -p ${PROJECT} -v ${DEFECT}b -w /tmp/${PROJECT}_${DEFECT}_buggy

# Install project test
RUN cd /tmp/${PROJECT}_${DEFECT}_buggy && mvn clean install -DskipTests

#copy script to run
COPY ./exec/${EXEC}_exec.sh /tmp/${EXEC}_exec.sh

#define default workdir 
WORKDIR /tmp

#exec script
CMD ["sh", "${EXEC}_exec.sh"]