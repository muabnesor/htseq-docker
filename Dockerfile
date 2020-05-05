FROM ubuntu:18.04
MAINTAINER muabnesor <adam.rosenbaum@umu.se>

LABEL description="Image for HTSeq 0.11.1"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl3-dev \
    python3.6 \
    python-pip \
    python-numpy \
    python-pysam \
    python-setuptools && \
    apt-get clean && apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#ENV HTSLIB_VERSION 1.9

#RUN wget https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 && \
#    tar -vxjf htslib-${HTSLIB_VERSION}.tar.bz2 && \
#    cd htslib-${HTSLIB_VERSION} && \
#    ./configure && make && cd ..


# HTSeq 
ENV HTSEQ_VERSION 0.11.1

RUN pip install cython && \
    pip install htseq==${HTSEQ_VERSION}

