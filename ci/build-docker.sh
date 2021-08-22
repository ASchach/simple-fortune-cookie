#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${docker_username}" ]] && DockerRepo='' || DockerRepo="${docker_username}/"
SHORTHASH="$(git rev-parse --short HEAD)"
docker tag "$IMAGE_NAME" "${DockerRepo}simple-fortune-cookie-backend:$SHORTHASH"
docker build -t "${DockerRepo}simple-fortune-cookie-backend:latest" -t "${DockerRepo}simple-fortune-cookie-backend:$SHORTHASH" ./backend
docker build -t "${DockerRepo}simple-fortune-cookie-frontend:latest" -t "${DockerRepo}simple-fortune-cookie-frontend:$SHORTHASH" ./frontend