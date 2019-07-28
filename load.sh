#!/usr/bin/env bash




function load() {
    for file in ~/shell/*
    do
        name=$(basename ${file})
        name=${name%.*}

        if [[ $name == load ]]; then
            continue
        fi

        if [[ -O ${file} ]]; then
            chmod u+x ${file}
        fi

        if [[ -x ${file} ]]; then
            alias ${name}="sh ${file}"
            echo "alias ${name}=sh ${file}"
        fi
    done
}