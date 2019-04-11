#!/bin/bash

if [[ $# -ne 3 ]]
then
	echo "invalid argument please pass three arguments: "
	echo "$0 github_token owner/repo filepath"
    exit
fi

github_token="$1"
github_file="https://api.github.com/repos/$2/contents/$3"
curl -H "Authorization: token ${github_token}" -H 'Accept: application/vnd.github.v3.raw' -O -L "$github_file"
