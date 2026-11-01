# Задание 1. Основы управления конфигурацией инфраструктуры с Terraform

Реализованы все 7 руководств трека **Get Started — Docker** (developer.hashicorp.com):

| № | Руководство | Что демонстрирует файл/команда |
|---|---|---|
| 1 | What is Infrastructure as Code | декларативное описание инфраструктуры в HCL |
| 2 | Install Terraform | CLI v1.9.8 (в контейнере, см. ниже) |
| 3 | Build infrastructure | `terraform init/plan/apply` → контейнер nginx |
| 4 | Change infrastructure | `-var external_port=8001` → пересоздание контейнера |
| 5 | Destroy infrastructure | `terraform destroy` |
| 6 | Define input variables | `variables.tf` |
| 7 | Query data with outputs | `outputs.tf`, `terraform output` |

## Состав каталога

| Файл | Назначение |
|---|---|
| `terraform.tf` | версия Terraform и источник провайдера |
| `main.tf` | провайдер Docker, ресурсы `docker_image` и `docker_container` |
| `variables.tf` | входные переменные (имя, образ, порты) |
| `outputs.tf` | выходные значения (id, имя, URL) |
| `Dockerfile` | образ `lab5-terraform`: CLI + провайдер в локальном зеркале |
| `terraformrc` | конфигурация CLI: использовать локальное зеркало провайдеров |
| `tf.cmd` | обёртка запуска Terraform в контейнере |

## Почему Terraform запускается в контейнере

Сайты `releases.hashicorp.com` и `registry.terraform.io` недоступны для региона,
поэтому windows-бинарник Terraform и провайдер `kreuzwerker/docker` скачать
напрямую нельзя. Решение: официальный образ `hashicorp/terraform:1.9` из Docker Hub,
в который при сборке укладывается провайдер (загружается с GitHub Releases)
и конфигурация локального зеркала.

## Порядок выполнения

```powershell
cd D:\大四\de\LabRabota5\task1
docker build -t lab5-terraform .

.\tf.cmd version
.\tf.cmd init
.\tf.cmd fmt -check
.\tf.cmd validate
.\tf.cmd plan
.\tf.cmd apply -auto-approve

curl http://localhost:8000/          # Welcome to nginx!
.\tf.cmd output
.\tf.cmd state list

# изменение инфраструктуры: другой внешний порт
.\tf.cmd apply -auto-approve -var="external_port=8001"
curl http://localhost:8001/

# удаление инфраструктуры
.\tf.cmd destroy -auto-approve
```

После `destroy` контейнер и образ, созданные Terraform, удаляются.
