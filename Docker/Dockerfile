FROM phusion/baseimage:0.9.18
MAINTAINER Wolfgang Loder @wolfgang_loder

ENV REFRESHED_AT 2016-08-08

RUN echo /root /etc/container_environment/HOME

CMD ["sbin/my_init"]

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set versions
ENV ERLANG_VERSION=1:19.0
ENV ELIXIR_VERSION=1.3.2

WORKDIR /tmp

# See : https://github.com/phusion/baseimage-docker/issues/58
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Get pre-requisites
RUN apt-get update && apt-get install -y \
    git \
    make \
    unzip \
    wget

# Setup Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb &&  dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install erlang -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup Elixir from precompiled zip on GitHub
WORKDIR /usr/local/elixir
RUN wget https://github.com/elixir-lang/elixir/releases/download/v$ELIXIR_VERSION/Precompiled.zip \
  && unzip Precompiled.zip \
  && ln -s /usr/local/elixir/bin/elixirc /usr/local/bin/elixirc \
  && ln -s /usr/local/elixir/bin/elixir /usr/local/bin/elixir \
  && ln -s /usr/local/elixir/bin/mix /usr/local/bin/mix \
  && ln -s /usr/local/elixir/bin/iex /usr/local/bin/iex \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm /usr/local/elixir/Precompiled.zip

WORKDIR /
