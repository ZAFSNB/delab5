# Задание 2. Управление конфигурацией серверов с помощью Ansible

Управляемые узлы — три узла кластера Kubernetes из лабораторной работы 4
(кластер kind `lab4`: `lab4-control-plane`, `lab4-worker`, `lab4-worker2`).
Узлы kind являются контейнерами Docker, поэтому в инвентаре используется
connection-плагин `community.docker.docker`.

## Состав каталога

| Файл | Назначение |
|---|---|
| `inventory.ini` | инвентарь: группа `kubernetes_nodes` из трёх узлов |
| `ansible.cfg` | настройки Ansible (инвентарь, интерпретатор Python) |
| `playbooks/site.yml` | базовый playbook: пакеты, шаблон `/etc/motd`, оболочка root, handler |
| `playbooks/packages.yml` | установка пакетов циклом с выводом результата |
| `playbooks/demo.yml` | демонстрация переменных, фактов, `when`, `register`, `copy` |
| `playbooks/templates/motd.j2` | шаблон Jinja2 |
| `Dockerfile` | образ `lab5-ansible`: `alpine/ansible` + docker CLI |
| `ans.cmd` / `apb.cmd` | обёртки для ad-hoc команд и playbook |

## Подготовка

```powershell
cd D:\大四\de\LabRabota5\task2
docker build -t lab5-ansible .

# на узлах кластера kind нет python3 — устанавливаем его модулем raw
.\ans.cmd all -i inventory.ini -m raw -a "apt-get update -qq && apt-get install -y -qq python3"
```

## Ad-hoc команды

```powershell
.\ans.cmd all -m ping                                   # проверка связи с группой узлов
.\ans.cmd all -m command -a "uname -a"
.\ans.cmd all -m apt -a "name=zsh state=present"        # установка zsh
.\ans.cmd all -m command -a "zsh --version"
.\ans.cmd all -m setup -a "filter=ansible_distribution*"
```

## Playbooks

```powershell
.\apb.cmd playbooks/site.yml
.\apb.cmd playbooks/packages.yml
.\apb.cmd playbooks/demo.yml
```

Проверка без изменений: `.\apb.cmd playbooks/site.yml --check`.
