FROM alpine

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     51888
ENV PASSWORD        psw
ENV METHOD          aes-256-cfb
ENV PROTOCOL        origin
ENV OBFS            tls1.2_ticket_auth
ENV TIMEOUT         300
ENV DNS_ADDR        1.1.1.1
ENV DNS_ADDR_2      8.8.8.8

ARG BRANCH=manyuser
ARG WORK=~

RUN apk --no-cache add python \
    libsodium \
    wget

RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/iceton/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK

WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks

EXPOSE $SERVER_PORT
CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS

