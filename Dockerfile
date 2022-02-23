FROM ubuntu:18.04

EXPOSE 22 1234

COPY install/ /install/

RUN bash /install/000-install.sh
