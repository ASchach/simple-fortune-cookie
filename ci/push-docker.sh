#!/bin/bash
echo "$docker_password" | docker login --username "$docker_username" --password-stdin
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::4}"
[[ -z "${docker_username}" ]] && DockerRepo='' || DockerRepo="${docker_username}/"
SHORTHASH="$(git rev-parse --short HEAD)"
docker tag $IMAGE_NAME $DOCKER_REPO:$SHORTHASH
docker push $DOCKER_REPO:$SHORTHASH
docker push "$docker_username/simple-fortune-cookie-backend:$Tag"
docker push "$docker_username/simple-fortune-cookie-frontend:$Tag" &
wait
