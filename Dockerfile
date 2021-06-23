# Base Image
FROM r-base:4.0.2

# Maintainer
MAINTAINER DaveLab <lab.dave@gmail.com>

# update the OS related packages
RUN apt-get update -y && apt-get install -y \
    build-essential \
    vim \
    less \
    gawk \
    git \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    wget \
    bedtools \
    parallel \
    unzip \
    cmake \
    libxml2-dev  	

WORKDIR /usr/local/bin

# clone clonotypemerge repo
ADD https://api.github.com/repos/lanieehapp/clonotypemerge/git/refs/heads/ version.json
RUN git clone https://github.com/lanieehapp/clonotypemerge.git

# add clonotypemerge repo to SYSPATH
ENV PATH clonotypemerge:$PATH

# change the permission of the repo
RUN chmod 777 -R clonotypemerge
WORKDIR /usr/local/bin/clonotypemerge
