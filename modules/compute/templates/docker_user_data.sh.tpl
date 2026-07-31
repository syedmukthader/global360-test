#!/bin/bash
set -euxo pipefail

# Amazon Linux 2023 - install Docker, pull the published image and run it,
# mapping the container's port 80 to the host's port 80.
dnf install -y docker
systemctl enable docker
systemctl start docker

docker pull ${container_image}
docker run -d --restart unless-stopped -p 80:80 --name web ${container_image}
