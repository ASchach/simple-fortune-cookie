#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::4}"
[[ -z "${docker_username}" ]] && DockerRepo='' || DockerRepo="${docker_username}/"
docker build -t "${DockerRepo}simple-fortune-cookie-backend:latest" -t "${DockerRepo}simple-fortune-cookie-backend:$Tag" ./backend
docker build -t "${DockerRepo}simple-fortune-cookie-frontend:latest" -t "${DockerRepo}simple-fortune-cookie-frontend:$Tag" ./frontend