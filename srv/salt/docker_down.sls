
{% set name = "websocket_chat" %}

docker-down:
  docker_container.stopped:
    - names:
      - {{ name }}

