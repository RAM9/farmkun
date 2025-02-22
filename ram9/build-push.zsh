#!/usr/bin/env zsh
image="ram9-site"
repo="harbor.ram9.cc/r9"
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
 podman login harbor.ram9.cc --username robot\$r9\+repo_read --secret r9-repo-read
 podman build --tag ${uri}:${version} . 
 podman push ${uri}:${version}
fi

