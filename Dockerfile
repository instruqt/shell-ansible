FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install --no-install-recommends \
    bash \
    openssl \
    vim \
    curl \
    util-linux \
    jq \
    nano \
    wget \
    joe \
    emacs \
    dropbear \
    ca-certificates \
    ansible

# Install dumb-init
ENV DUMB_INIT_VERSION=1.2.0
RUN curl -sS -L -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64
RUN chmod +x /usr/local/bin/dumb-init

# Install a nice vimrc file and prompt (by soulshake)
RUN curl -sS -L -o /etc/vim/vimrc.local https://raw.githubusercontent.com/zcodes/vim-colors-basic/master/colors/basic-dark.vim

# Move to our home
WORKDIR /root

ENV GOTTY_TITLE_FORMAT="Instruqt Shell" \
    GOTTY_CONFIG=/etc/gotty.conf \
    WEBSHELL="/usr/local/bin/gotty /bin/bash -l" \
    EDITOR=nano \
    TERM=xterm

ADD gotty /usr/local/bin/gotty
ADD gotty.conf ${GOTTY_CONFIG}
ADD start.sh /start.sh

EXPOSE 8080 22

ENTRYPOINT ["/start.sh"]
