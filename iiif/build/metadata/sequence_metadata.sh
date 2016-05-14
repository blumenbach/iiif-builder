#!/bin/bash
if (( $# < 3 )); then
    end=$1    
fi
steps=($(seq -w -s' ' 1 3 $end))
ids=($(seq -w -s' ' 1 $end))


for step in "${steps[@]}"
do
((first = c))
((second = first+1))
((third = second+1))
    printf "_:c$first <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://localhost:8080/fcrepo/rest/blumenbach/00027/canvas/$id> .
    _:c$second> <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:c$third .\n" >> "seq1.ttl"
done