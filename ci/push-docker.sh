#!/bin/bash
echo "$docker_password" | docker login --username "$docker_username" --password-stdin
SHORTHASH="$(git rev-parse --short HEAD)"
docker tag "$IMAGE_NAME" "$docker_username/simple-fortune-cookie-backend:$SHORTHASH"
docker push "$docker_username/simple-fortune-cookie-backend:$SHORTHASH"
docker push "$docker_username/simple-fortune-cookie-frontend:$SHORTHASH" &
wait
