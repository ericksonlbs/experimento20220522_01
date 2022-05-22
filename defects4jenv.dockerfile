ARG JAVA_VERSION=8
FROM openjdk:${JAVA_VERSION}
#image name sample defects4jenv:java8
# Update aptitude with new repo
RUN apt-get update

# Install software GIT
RUN apt-get install -y git

# Install software maven
RUN apt-get install -y maven

# Install software maven
RUN apt-get install -y cpanminus

# Download Defects4J
RUN git clone https://github.com/rjust/defects4j

# Install Defects4J dependencies
RUN apt-get update -y
RUN apt-get install -y libdbi-perl
RUN apt-get install -y libtext-csv-perl
RUN apt-get install -y libdbd-csv-perl
RUN apt-get install -y libjson-parse-perl

# Install Defects4J
RUN cd defects4j && \
    cpanm --installdeps . && \
    ./init.sh && \
    export PATH=$PATH:defects4j/framework/bin

# Define workdir
WORKDIR /defects4j/framework/bin/

CMD ["defects4j", "info", "-p", "Lang"]