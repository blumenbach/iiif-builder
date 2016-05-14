#!/usr/bin/env bash
if (( $# < 3 )); then
    start=$1
    end=$2
fi
ids=($(seq -w -s' ' $start $end))
for id in "${ids[@]}"
do
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/base/list/l$id"
done
