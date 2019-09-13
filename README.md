## SaltStack test

##### Цель данного проэкта получить практический и теретический опыт.

> Задачи:
1.    Контейнеризировать приложение (Erlang). 
      Приложение чат на web sockets (https://github.com/Antibiotic/websocket_chat) 
2.    Развернуть docker host на minion машине с помощью salt states
3.    Развернуть и запустить приложение на docker host с помощью salt states

### Требования для запуска проэкта:
1. Git 		https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
2. Vagrant 	https://www.vagrantup.com/docs/installation/

### Инструкци запуска:

клонируем проэкт
```bash
git clone https://github.com/artemzdor/SaltStack_test.git
```

заходим в нутрь проэкта
```bash
cd ./SaltStack_test
```

дальше нам протребуется поднят тестовый стенд (машины: salt master и salt minion)
для этого используем проэкт https://github.com/UtahDave/salt-vagrant-demo

```bash
cd ./text
```
запускаем тестовый стенд
```bash
bash ./create_stand.sh
```

после развернутся виртуальные машины:
*Master  - 192.168.50.10
Minion1 - 192.168.50.11
Minion2 - 192.168.50.12*

заходим в проэкт Vagrant 
```bash
cd ./salt-vagrant-demo
```

подключаемя к мастеру

```bash
vagrant ssh master
```

клонируем проэкт
```bash
git clone https://github.com/artemzdor/SaltStack_test.git
```

запускаем скрипт чтобы скопировать плейбуки в базовую директорию /srv/salt
```bash
bash ./SaltStack_test/srv/cp_srv_salt.sh
```

идем в /srv/salt

```bash
cd /srv/salt
```

устанавливаем docker https://docs.docker.com/install/linux/docker-ce/ubuntu/
```bash
bash ./docker_install.sh
```

скачиваем докер образ и запускаем
```bash
bash ./docker_up.sh
```

теперь можно в браузере открыть URL (будет два разных чата)
`192.168.50.11:8080`
`192.168.50.12:8080`

для остановки контейнеров
```bash
bash ./docker_down.sh
```

### Инструкци сборки контейнера:

```bash
cd ./SaltStack_test/docker_src
```

запускаем билд
 - скачивается проэкт https://github.com/Antibiotic/websocket_chat
 - копируется скрипт запуска run_websocket_chat.sh
 
```bash
bash ./build.sh
```

не забываем авторизировантся на hub.docker.com (docker login)

потом пушим
```bash
bash ./push.sh
```

### Проблемы:
 - Данные вариант работает на Ubuntu
 - websocket_chat в js (Статически указан адресс к вебсокету) => WebSocket("ws://localhost:8080/websocket")
   скрипт (SaltStack_test/docker_src/run_websocket_chat.sh) 
   при запуске заменяет на WebSocket("ws://" + location.host + "/websocket")
 - плейбук (SaltStack_test/srv/salt/docker_install.sls) не будет работать с другими диструбутивами 
   использует команды 
     - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add
	 - add-apt-repository "deb [arch={{ osarch }}] https://download.docker.com/linux/ubuntu {{ oscodename }} stable"
