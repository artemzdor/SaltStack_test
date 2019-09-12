#!/usr/bin/env bash

cd /usr/src/websocket_chat

echo "Start: Websocket Chat"

# КОСТЫЛЬ (Статически указан адресс к вебсокету в js) => WebSocket("ws://localhost:8080/websocket")
# заменил теперь берет у браузера адресс. 			  => WebSocket("ws://" + location.host + "/websocket")
export PATH_JS='/usr/src/websocket_chat/_build/default/lib/websocket_chat/priv/www/index.js'
sed -i '6c\    socket = new WebSocket("ws://" + location.host + "/websocket")' $PATH_JS
# END КОСТЫЛЬ

erl -noshell -pa _build/default/lib/cowboy/ebin/ -pa _build/default/lib/cowlib/ebin/ -pa _build/default/lib/ranch/ebin/ -pa _build/default/lib/websocket_chat/ebin/ -pa _build/default/lib/jsx/ebin/ -s websocket_chat_app fast_start

echo "Stop: Websocket Chat"

