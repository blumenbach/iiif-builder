#!/usr/bin/env bash
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@000.ttl" "http://localhost:8080/fcrepo/rest/edition/base/res/000.tif/fcr:metadata"
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@001.ttl" "http://localhost:8080/fcrepo/rest/edition/base/res/001.tif/fcr:metadata" 
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@002.ttl" "http://localhost:8080/fcrepo/rest/edition/base/res/002.tif/fcr:metadata" 
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@003.ttl" "http://localhost:8080/fcrepo/rest/edition/base/res/003.tif/fcr:metadata" 
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@004.ttl" "http://localhost:8080/fcrepo/rest/edition/base/res/004.tif/fcr:metadata" 
