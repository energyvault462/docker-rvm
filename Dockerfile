from ubuntu
MAINTAINER Brent Johnson <brentj433@gmail.com>

ARG BUILD_DATE
ARG BUILD_NUMBER
ARG VERSION

LABEL org.metadata.build-date=$BUILD_DATE \
	   org.metadata.version=$VERSION.$BUILD_NUMBER \
	   org.metadata.name="Brent RVM/Ruby 2.3.0 container" \
	   org.metadata.description="A basic Ruby 2.3.0" \
	   org.metadata.url="https://github.com/energyvault462/docker-ruby-2.3" \
	   org.metadata.vcs-url="https://github.com/energyvault462/docker-ruby-2.3"

RUN apt-get update && apt-get install -y curl patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev nano wget libgemplugin-ruby

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
    wget https://github.com/rvm/rvm/archive/1.27.0.tar.gz && \
    tar xvf 1.27.0.tar.gz && \
    cd rvm-1.27.0 && \
    ./install && \
    cd /tmp && \
    rm -rf 1.27.0.tar.gz rvm-1.27.0 && \
    echo "bundler" >> /usr/local/rvm/gemsets/global.gems


WORKDIR /
