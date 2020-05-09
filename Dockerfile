FROM ubuntu:19.10

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN echo -n \
  | openssl s_client -showcerts -connect github.com:443 2>/dev/null \
  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'

RUN apt update \
  && apt upgrade -y \
  && apt install -y \
    build-essential \
    curl \
    git \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    llvm \
    make \
    python-openssl \
    xz-utils \
    zlib1g-dev \
  && git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
  && { \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.bashrc; \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.bashrc; \
    echo 'eval "$(pyenv init -)"' >>~/.bashrc; \
  } \
  && apt clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV PATH /root/.pyenv/bin:$PATH

VOLUME /root/.pyenv
