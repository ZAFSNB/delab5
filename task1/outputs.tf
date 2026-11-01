# Выходные значения — показывают результат применения конфигурации
output "container_id" {
  description = "Идентификатор созданного контейнера"
  value       = docker_container.nginx.id
}

output "container_name" {
  description = "Имя контейнера"
  value       = docker_container.nginx.name
}

output "url" {
  description = "Адрес, по которому доступен контейнер"
  value       = "http://localhost:${var.external_port}"
}
