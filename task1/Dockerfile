# Образ для запуска Terraform на Windows.
#
# Причина: сайт releases.hashicorp.com блокирован для региона, поэтому
# windows-бинарник terraform скачать нельзя. Официальный образ
# hashicorp/terraform доступен в Docker Hub и содержит тот же CLI.
#
# Дополнительно в образ укладывается провайдер kreuzwerker/docker в
# локальное зеркало /plugins — registry.terraform.io также недоступен.
FROM hashicorp/terraform:1.9

RUN apk add --no-cache curl unzip && \
    mkdir -p /plugins/registry.terraform.io/kreuzwerker/docker/4.6.0/linux_amd64 && \
    curl -fsSL -o /tmp/provider.zip \
      "https://github.com/kreuzwerker/terraform-provider-docker/releases/download/v4.6.0/terraform-provider-docker_4.6.0_linux_amd64.zip" && \
    unzip -q /tmp/provider.zip -d /plugins/registry.terraform.io/kreuzwerker/docker/4.6.0/linux_amd64 && \
    rm -f /tmp/provider.zip && \
    chmod +x /plugins/registry.terraform.io/kreuzwerker/docker/4.6.0/linux_amd64/terraform-provider-docker_v4.6.0

# Конфигурация CLI: использовать локальное зеркало провайдеров
COPY terraformrc /root/.terraformrc

WORKDIR /workspace
