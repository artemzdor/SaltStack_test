{% set oscodename = salt.grains.get("oscodename") %}
{% set osarch = salt.grains.get("osarch") %}
#{% set url_gpg = "https://download.docker.com/linux/ubuntu/gpg" %}

docker-remove-old:
  pkg.removed:
    - pkgs: [docker, docker-engine, docker.io, containerd, runc]

install-curl:
  pkg.installed:
    - pkgs: [curl]

docker-apt-key:
  cmd.run:
    - name: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

docker-add-app:
  cmd.run:
    - name: add-apt-repository "deb [arch={{ osarch }}] https://download.docker.com/linux/ubuntu {{ oscodename }} stable"

docker-install:
  pkg.installed:
    - pkgs: [docker-ce, docker-ce-cli, containerd.io]

python-pip-install:
  pkg.installed:
    - pkgs: [python-pip]

docker-api-remove-old:
  pip.removed:
    - name: docker-py

docker-api-py-install:
  pip.installed:
    - pkgs: [docker]




#{% set source_hash = salt['cmd.shell']('echo "md5=`curl -s "{}" | md5sum | cut -c -32`"'.format(url_gpg)) %}
#
#get-gpg:
#  file.managed:
#    - name: /tmp/gpg.pem
#    - source: {{ url_gpg }}
#    - source_hash: {{ source_hash }}
#
#add_gpg:
#  gpg.trust_key:
#    - keyid: 0EBFCD88
