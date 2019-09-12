
{% set name = "websocket_chat" %}

docker-up:
  docker_container.stopped:
    - names:
      - {{ name }}

