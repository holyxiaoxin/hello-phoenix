FROM ubuntu:trusty

MAINTAINER Songge Chen <chen.s@wustl.edu>

#Set Your Environment Variables
ENV CIRCLE_PROJECT_REPONAME hello_phoenix

ENV ERLANG_VERSION 19.1
ENV ELIXIR_VERSION v1.4.4

ENV MIX_ENV test
ENV HOME /root
ENV INSTALL_PATH $HOME/dependencies

ENV ERLANG_PATH $INSTALL_PATH/otp_src_$ERLANG_VERSION
ENV ELIXIR_PATH $INSTALL_PATH/elixir_$ELIXIR_VERSION
ENV DIALYZER_PATH $INSTALL_PATH/dialyxir

ENV PATH $ERLANG_PATH/bin:$ELIXIR_PATH/bin:$PATH:$ERLANG_PATH/bin:$PATH

RUN apt-get update && apt-get install -y \
    curl \
    git \
    autoconf \
    libncurses-dev \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev

ADD . /root/$CIRCLE_PROJECT_REPONAME
WORKDIR /root/$CIRCLE_PROJECT_REPONAME

RUN \
    chmod 755 /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/*.sh

RUN \
    /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/prepare.sh && \
    /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/build.sh
