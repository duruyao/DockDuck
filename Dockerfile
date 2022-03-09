FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y

ENV LC_ALL="C"
ENV DEBIAN_FRONTEND="noninteractive"

## install basic tools
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN apt-get install -y build-essential
RUN apt-get install -y gcc g++ clang
RUN apt-get install -y make cmake ninja-build autoconf automake
RUN apt-get install -y gdb gdbserver
RUN apt-get install -y tree
RUN apt-get install -y git subversion
RUN apt-get install -y locales locales-all
RUN apt-get install -y zip unzip gzip tar
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y openssh-server rsync sshpass
RUN apt-get install -y curl wget

EXPOSE 22 1234

COPY conf /duck
COPY login /duck

## configure proxy
#ARG HOST_PROXY="172.17.0.1:7890"
#ARG http_proxy="http://$HOST_PROXY"
#ARG https_proxy="http://$HOST_PROXY"
#ARG ftp_proxy="http://$HOST_PROXY"
#ARG no_proxy="localhost,127.0.0.0/8,::1"

## configure vim
RUN mkdir -p /duck/.vim/autoload && curl -LSso /duck/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN mkdir -p /duck/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git /duck/.vim/bundle/nerdtree
RUN cp /duck/.vimrc ~/.vimrc
RUN cp -r /duck/.vim ~/.vim

## configure tmux
RUN cp /duck/.tmux.conf ~/.tmux.conf

## configure ssh
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

## configure language
RUN locale-gen en_US.UTF-8
RUN echo "export LANG=en_US.UTF-8" >>/etc/profile
RUN echo "export LC_ALL=en_US.UTF-8" >>/etc/profile
RUN echo "export LANGUAGE=en_US.UTF-8" >>/etc/profile

## configure command prompt
RUN cat /duck/root.PS1 >>~/.bashrc

########################################################
# add custom packages and development environment here #
########################################################
