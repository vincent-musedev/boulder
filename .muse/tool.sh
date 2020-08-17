
#!/usr/bin/env bash

# dir=$1 but it is not needed
commit=$2
cmd=$3

PACKAGES="github.com/letsencrypt/boulder/cmd/..."

function version() {
    echo 1
}

function applicable() {
    echo "true"
}

function run() {
    $GOPATH/bin/staticcheck -f json $PACKAGES | jq '. | {type:.code, file: .location.file, message:.message,line:.location.line}'
}

if [[ "$cmd" = "run" ]] ; then
  run
fi
if [[ "$cmd" = "applicable" ]] ; then
  applicable
fi
if [[ "$cmd" = "version" ]] ; then
  version
fi
