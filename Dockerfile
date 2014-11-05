# Dockerfile for Ubuntu with linode-cli
#
# https://github.com/linode/cli
# https://www.linode.com/api

FROM ubuntu:14.04
MAINTAINER Ole Bendik Kvisberg <olekvi@kvisberg.net>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y wget
RUN bash -c 'echo "deb http://apt.linode.com/ stable main" > /etc/apt/sources.list.d/linode.list'
RUN wget -q -O- https://apt.linode.com/linode.gpg | sudo apt-key add -
RUN apt-get update && apt-get install -y linode-cli
