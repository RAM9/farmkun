#!/bin/sh
docker pull quay.io/coreos/butane:release
echo "updating farmkun.ign"
docker run -i quay.io/coreos/butane:release --pretty --strict < core-os.yaml > farmkun.ign
