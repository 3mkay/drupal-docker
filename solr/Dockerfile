FROM ubuntu:utopic
MAINTAINER Tommy Lynge Jørgensen <tlyngej@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq install \
        wget \
        openjdk-8-jre && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://www.whoishostingthis.com/mirrors/apache/lucene/solr/4.8.1/solr-4.8.1.tgz
RUN tar xf solr-4.8.1.tgz -C /srv
RUN rm solr-4.8.1.tgz
ADD conf /srv/solr-4.8.1/example/solr/collection1/conf

EXPOSE 8983
WORKDIR /srv/solr-4.8.1/example
