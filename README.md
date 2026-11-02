# Overview

Report on LabRabota5. Проектирование модели управления версиями ПО, конфигурациями и непрерывной поставкой (Terraform, Ansible).


- Задание 1 (группа 13) — каталог `task1/`: Terraform + провайдер Docker (7 руководств Get Started).
- Задание 2 (группа 13) — каталог `task2/`: Ansible (инвентарь, ad-hoc команды, playbooks).
- Отчет — `docs/report.md`.

Быстрый запуск:

```bash
cd task1 && docker build -t lab5-terraform . && docker run --rm -v "%CD%:/workspace" -v /var/run/docker.sock:/var/run/docker.sock -w /workspace lab5-terraform init
cd ../task2 && docker build -t lab5-ansible .
```

# Author

Чжао Аофэй, группа 13.
