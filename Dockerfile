FROM finchsec/kali:base as builder
# hadolint ignore=DL3005,DL3008
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install wget unzip libpcap-dev build-essential -y && \
    wget https://github.com/kimocoder/reaver-wps-fork-t6x/archive/refs/heads/wifite.zip && \
    unzip wifite.zip
WORKDIR /reaver-wps-fork-t6x-wifite/src
RUN ./configure && \
    make && \
    make install


FROM finchsec/kali:base
LABEL org.opencontainers.image.authors="thomas@finchsec.com"
# hadolint ignore=DL3005,DL3008
RUN apt-get update && \
    apt-get dist-upgrade -y && \
        apt-get install libpcap0.8 pixiewps --no-install-recommends -y
COPY --from=builder /reaver-wps-fork-t6x-wifite/src/reaver /usr/local/sbin/reaver
# Wash is just a symlink to reaver
RUN ln -s /usr/local/sbin/reaver /usr/local/sbin/wash