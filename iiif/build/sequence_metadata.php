<?php


$start = $argv[1];
$end = $argv[2];

function makeSequence($end) {
    $seq = [];
    for($i = 0; $i < $end; $i+=3) {
        $seq[] = str_pad($i, 3, "0", STR_PAD_LEFT);
    }
    return $seq;
}
function getFirst($third){
    $first = str_pad($third-3, 3, "0", STR_PAD_LEFT);
    return "_:c$first";
}
function buildStatement($seq) {
    $count = 0;
    foreach ($seq as $num) {
        $first = str_pad($num, 3, "0", STR_PAD_LEFT);
        $second = str_pad($first+1, 3, "0", STR_PAD_LEFT);
        $third = str_pad($second+1, 3, "0", STR_PAD_LEFT);
        $id = str_pad($count++, 3, "0", STR_PAD_LEFT);
        $fp = fopen("./sequence.ttl", "a");
        $out = getFirst($third) . " <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://localhost:8080/fcrepo/rest/edition/00027/canvas/c$id> .\n".
        getFirst($third) . " <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:c$third .\n";
        fwrite($fp, $out);
    }
}
$seq = makeSequence($end);
buildStatement($seq);