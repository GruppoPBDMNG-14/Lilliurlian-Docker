# Pull latest Ubuntu base image
FROM ubuntu:latest


# Expose MongoDB port
EXPOSE 27017


# Expose Spark Server port
EXPOSE 8080


# Expose HTTP port
EXPOSE 28017


# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

  
# Create MongoDB /data/db directory
RUN mkdir -p /data/db


# Set usr/bin/mongod as the entry point
ENTRYPOINT ["/usr/bin/mongod"]
  

#Get repositories for java8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update


#Install JDK 8
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y


# Install maven
RUN apt-get update
RUN apt-get install -y maven


#Get the source repository
RUN git clone https://github.com/GruppoPBDMNG-14/Lilliurlian


#create the start server file and make it executable
RUN echo '#!/bin/bash' >> /start-server
RUN echo 'cd /Lilliurlian/Lilliurlian' >> /start-server
RUN echo 'mvn package' >> /start-server
RUN echo 'java -jar target/Lilliurlian.jar' >> /start-server
RUN chmod 777 /start-server