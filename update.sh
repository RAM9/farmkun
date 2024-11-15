#!/bin/sh
podman pull quay.io/coreos/butane:release
echo "updating farmkun*.ign and farmbot.ign"
echo "farmbot"
echo "farmkun-generic-server"
podman run --replace --name butane-farmkun-update -v ./local:/local  -i quay.io/coreos/butane:release -d /local --strict --pretty < farmkun-generic-server.yaml > farmkun.ign
podman run --replace --name butane-farmkun-update -v ./local:/local  -i quay.io/coreos/butane:release -d /local --strict --pretty < farmbot.yaml > farmbot.ign
