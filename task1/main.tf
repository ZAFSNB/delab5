# Провайдер Docker: внутри контейнера terraform используется unix-сокет,
# смонтированный с хоста (Docker Desktop).
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Ресурс 1: образ. Docker загрузит его, если он отсутствует локально.
resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = false
}

# Ресурс 2: контейнер на основе образа.
# Публикует внутренний порт 80 на внешний порт хоста.
resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
