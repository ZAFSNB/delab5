# Входные переменные — позволяют менять конфигурацию без правки основного кода
variable "container_name" {
  description = "Имя создаваемого контейнера"
  type        = string
  default     = "lab5-nginx"
}

variable "image_name" {
  description = "Образ Docker"
  type        = string
  default     = "nginx:1.27-alpine"
}

variable "external_port" {
  description = "Порт на хосте, на который публикуется контейнер"
  type        = number
  default     = 8000
}

variable "internal_port" {
  description = "Порт внутри контейнера"
  type        = number
  default     = 80
}
