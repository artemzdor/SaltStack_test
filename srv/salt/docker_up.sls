
{% set image = "asfree/test_erlang" %}
{% set tag = "latest" %}
{% set name = "websocket_chat" %}

docker-image-pull:
  docker_image.present:
    - name: {{ image }}
    - tag: {{ tag }}

docker-up:
  docker_container.running:
    - name: {{ name }}
    - image: '{{ image }}:{{ tag }}'
    - port_bindings: {8080: 8080}
