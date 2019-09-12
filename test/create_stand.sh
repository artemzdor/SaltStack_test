#!/usr/bin/env bash
# https://github.com/UtahDave/salt-vagrant-demo

git clone https://github.com/UtahDave/salt-vagrant-demo.git

cd salt-vagrant-demo

vagrant plugin install vagrant-vbguest

vagrant up

# vagrant ssh master
# salt \* test.ping
