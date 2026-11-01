@echo off
rem Ad-hoc commands: ans all -i inventory.ini -m ping
docker run --rm -e ANSIBLE_CONFIG=/work/ansible.cfg -v "%CD%:/work" -v /var/run/docker.sock:/var/run/docker.sock -w /work lab5-ansible ansible %*
