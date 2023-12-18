FROM ubuntu:22.04

COPY VIMSCRIPT_* /tmp/
COPY run_vim /usr/local/bin/
RUN apt-get update && \
    apt-get install -y vim python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
