#!/bin/bash


for i in `find modules_not/ -type d| cut -f 2- -d/`
do
    # echo "$i"
    repo_name=$(echo "$i" | sed 's/\//-/')
    full_repo_name="ansible-role-modules-$repo_name"
    echo "$full_repo_name"
    ansible-galaxy init --init-path=roles/ "$full_repo_name"
    mkdir roles/$full_repo_name/library/
    cp -var modules_not/$i/*.py roles/$full_repo_name/library/
done
