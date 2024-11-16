#!/usr/bin/env zsh
image="farm-site"
repo="c8n.io/robotarmy"
uri="${repo}/${image}"
if [ -z "$1" ]
then
echo "---"
echo " build push for ${uri}"
echo ""
echo " required flag missing :"
echo " -v version-tag "
else
    while [[ "$#" -gt 0 ]]
    do case $1 in
        -v|--version) version="$2"
        shift;;
        *) echo "Unknown parameter passed: $1"
        exit 1;;
    esac
    shift
    done
 podman login c8n.io --username shodou@ram9.cc --secret robotarmy-password
 podman build --tag ${uri}:${version} . 
 podman push ${uri}:${version}
fi

