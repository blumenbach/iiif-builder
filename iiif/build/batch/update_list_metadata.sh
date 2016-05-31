#!/usr/bin/env bash

if (( $# < 3 )); then
    start=$1
    end=$2
fi
ids=($(seq -w -s' ' $start $end))
for id in "${ids[@]}"
do
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@l$id.ttl" "http://localhost:8080/fcrepo/rest/edition/base/list/l$id"
done

