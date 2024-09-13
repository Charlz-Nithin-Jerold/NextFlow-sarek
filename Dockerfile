# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Metadata for the image
LABEL version="1.0" \
      description="Image for running Nextflow with the latest version."

# Install essential packages and Java
RUN apt-get update -y && \
    apt-get install -y wget openjdk-17-jre && \
    apt-get clean

# Install the latest version of Nextflow
RUN wget -qO- https://github.com/nextflow-io/nextflow/releases/latest/download/nextflow | bash && \
    chmod 777 nextflow && \
    mv nextflow /usr/local/bin/nextflow

# Set the environment variable for the PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
