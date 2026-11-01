# Образ control-node Ansible для Windows.
#
# Базовый образ alpine/ansible содержит ansible-core и коллекцию
# community.docker, но не содержит docker CLI, который нужен
# connection-плагину community.docker.docker для подключения к узлам
# кластера kind. Добавляем CLI.
FROM alpine/ansible

USER root
RUN apk add --no-cache docker-cli

WORKDIR /work
