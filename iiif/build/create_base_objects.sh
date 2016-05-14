#!/usr/bin/env bash
if (( $# < 2 )); then
    id=$1
fi
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/canvas"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/sequence"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/annotation"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/list"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/range"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/layer"
curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/$id/res"