# Test project for titan-binaries


This folder contains a dummy TTCN project to show how to use the Docker image titan-binaries
in your toolchain.

Scenario: you have a TTCN project and you want to build and run it with Titan.
Here what are the next steps to use Docker in your process.

## The Docker file

The Dockerfile is a 2-liner:

   FROM titan-binaries:latest
   ADD src /work

The first line referers to the base image to use, in this case titan-binaries.
Note: You need titan-binaries to build the image locally before you can use it.


The second line adds your source directory into the container, so that it can be
built and run within the containerized environment.

Note: should you have specific requirements (e.g. c++ libs) to install, you can
add to the bottom of the Dockerfile using yum (the image is based on CentOs). E.g.:

   RUN yum install libxml2-devel

## Build and run the image

As simply as:

   sh BUILD.sh
   sh RUN.sh

Once the script is finished you will have built and run a complete TTCN project
with Titan in a Dockerized environment!
   

