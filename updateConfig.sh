#!/usr/bin/env bash

configRepository=$GOPATH/src/git.byted.org/ee/conf/lark
optConfig=/opt/tiger/ee/conf/lark
tmpConfig=/opt/tiger/ee/conf/olark

if [[ -e ${tmpConfig} ]]; then
    rm -f ${tmpConfig}
fi
mv ${optConfig}  ${tmpConfig}
cp -r ${configRepository} ${optConfig%/*}


