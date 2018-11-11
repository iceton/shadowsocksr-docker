# shadowsocksr-docker
ShadowsocksR Docker image based on https://hub.docker.com/r/breakwa11/shadowsocksr/~/dockerfile/
https://hub.docker.com/r/icet/shadowsocksr/

## Start the container
    docker run -d -p 51888:51888/tcp -p 51888:51888/udp -e PASSWORD='password' --restart always icet/shadowsocksr

## Config options and defaults

    ENV SERVER_ADDR     0.0.0.0
    ENV SERVER_PORT     51888
    ENV PASSWORD        psw
    ENV METHOD          aes-256-cfb
    ENV PROTOCOL        origin
    ENV OBFS            tls1.2_ticket_auth
    ENV TIMEOUT         300
    ENV DNS_ADDR        1.1.1.1
    ENV DNS_ADDR_2      8.8.8.8

Set config options using environment variables (`-e OBFS='http_simple'`).
