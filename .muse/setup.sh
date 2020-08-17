#!/usr/bin/env bash

apt update
apt install wget

wget -c https://golang.org/dl/go1.15.linux-amd64.tar.gz -O - | tar -xz -C /usr/local
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/local/go
mkdir -p $GOPATH/src/github.com/letsencrypt
ln -s /code $GOPATH/src/github.com/letsencrypt/boulder

go install honnef.co/go/tools/cmd/staticcheck
