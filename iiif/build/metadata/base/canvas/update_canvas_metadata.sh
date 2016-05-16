#!/usr/bin/env bash

if (( $# < 3 )); then
    start=$1
    end=$2
fi
ids=($(seq -w -s' ' $start $end))
for id in "${ids[@]}"
do
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@c$id.ttl" "http://localhost:8080/fcrepo/rest/edition/base/canvas/c$id"
done

