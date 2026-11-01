@echo off
rem Run Terraform CLI in a Docker container (Windows has no native terraform binary).
rem Usage: tf init | tf plan | tf apply -auto-approve | tf destroy -auto-approve
docker run --rm -v "%CD%:/workspace" -v /var/run/docker.sock:/var/run/docker.sock -w /workspace lab5-terraform %*
