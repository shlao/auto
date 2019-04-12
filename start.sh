#!/bin/bash

if [[ $# -lt 3 ]]
then
    echo "invalid argument please pass at least three arguments: "
    echo "$0 github_token owner/repo filepath"
    exit
fi

github_token="$1"
path="$3"
github_file="https://api.github.com/repos/$2/contents/${path}"

# https://stackoverflow.com/questions/18126559/how-can-i-download-a-single-raw-file-from-a-private-github-repo-using-the-comman
curl -H "Authorization: token ${github_token}" -H 'Accept: application/vnd.github.v3.raw' -O -L ${github_file}

script="${path##*/}"

if [[ -f "$script" ]]
then
    bash ${script} "$1" "$4" "$5" "$6"
fi
