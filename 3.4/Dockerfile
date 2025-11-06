FROM ubuntu:22.04
ARG VERSION=3.4.7

# Ensure to include username on your commands for proper installation path
# Example: docker build --build-arg USERNAME=$(whoami) --build-arg USER_UID=1001 --build-arg USER_GID=1001 .
ARG USERNAME=rbenv
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
 && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt-get update && apt-get install -y build-essential curl git autoconf bison \
    libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev
WORKDIR /src
RUN curl -fsSL https://cache.ruby-lang.org/pub/ruby/3.4/ruby-$VERSION.tar.gz | tar xz \
 && cd ruby-$VERSION \
 && ./configure --prefix=/home/$USERNAME/.rbenv/versions/$VERSION \
 && make -j$(nproc) && make install
RUN tar -czf /ruby-$VERSION.tar.gz -C /home/$USERNAME/.rbenv/versions $VERSION
