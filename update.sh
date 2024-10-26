#!/bin/sh
podman pull quay.io/coreos/butane:release
echo "updating farmkun.ign"
podman run --replace --mount=type=glob,src=../.ssh/id_ed*,dst=/ssh,z,ro=true --name butane-farmkun-update -i quay.io/coreos/butane:release --pretty --strict --files-dir /ssh/ < core-os.yaml > farmkun.ign

#docker run ---volume ~core/.ssh:/ssh -i quay.io/coreos/butane:release --pretty --strict --files-dir /ssh/ < core-os.yaml > farmkun.ign
