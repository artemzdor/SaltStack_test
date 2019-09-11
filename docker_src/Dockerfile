FROM erlang:22.0.7

MAINTAINER Artem Zdor "artemzdor@gmail.com"

RUN mkdir -p /usr/src/websocket_chat

WORKDIR /usr/src/websocket_chat

COPY ./websocket_chat/ /usr/src/websocket_chat
COPY run_websocket_chat.sh /usr/src/websocket_chat/run_websocket_chat.sh

EXPOSE 8080

RUN /bin/sh -c "make compile"

CMD ["/bin/sh", "-c", "/usr/src/websocket_chat/run_websocket_chat.sh"]
