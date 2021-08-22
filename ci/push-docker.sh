#!/bin/bash
echo "$docker_password" | docker login --username "$docker_username" --password-stdin
SHORTHASH="$(git rev-parse --short HEAD)"
docker tag $IMAGE_NAME $DOCKER_REPO:$SHORTHASH
docker push $DOCKER_REPO:$SHORTHASH
docker push "$docker_username/simple-fortune-cookie-backend:latest"
docker push "$docker_username/simple-fortune-cookie-frontend:latest" &
wait
