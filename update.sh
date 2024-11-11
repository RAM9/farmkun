#!/bin/sh
podman pull quay.io/coreos/butane:release
echo "updating farmkun*.ign and farmbot.ign"
echo "farmbot"
podman run --replace --name butane-farmkun-update -i quay.io/coreos/butane:release --pretty --strict < farmbot.yaml > farmbot.ign
echo "farmkun-generic-server"
podman run --replace --name butane-farmkun-update -i quay.io/coreos/butane:release --pretty --strict < farmkun-generic-server.yaml > farmkun.yaml
#echo "farmkun2"
#podman run --replace --name butane-farmkun-update -i quay.io/coreos/butane:release --pretty --strict < farmkun2.yaml > farmkun2.ign
#echo "farmkun3"
#podman run --replace --name butane-farmkun-update -i quay.io/coreos/butane:release --pretty --strict < farmkun3.yaml > farmkun3.ign

