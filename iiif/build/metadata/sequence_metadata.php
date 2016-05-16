<?php


$start = $argv[1];
$end = $argv[2];

function makeSequence($start, $end) {
    $seq = [];
    for($i = $start; $i < $end; $i+=2) {
        $seq[] = str_pad($i, 3, "0", STR_PAD_LEFT);
    }
    return $seq;
}
function getFirst($second){
    $first = str_pad($second-2, 3, "0", STR_PAD_LEFT);
    return "_:c$first";
}
function buildStatement($seq) {
    $fp = fopen("./sequence.ttl", "a");
    $header = addHeader();
    fwrite($fp, $header);
    $count = 0;
    foreach ($seq as $num) {
        $first = str_pad($num, 3, "0", STR_PAD_LEFT);
        $second = str_pad($first+1, 3, "0", STR_PAD_LEFT);
        $id = str_pad($count++, 3, "0", STR_PAD_LEFT);
        $out = getFirst($second) . " <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://localhost:8080/fcrepo/rest/edition/base/canvas/c$id> .\n".
        getFirst($second) . " <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:c$second.\n";
        fwrite($fp, $out);
    }
    $footer = addFooter();
    fwrite($fp, $footer);
}

function addHeader() {
    return "PREFIX premis: <http://www.loc.gov/premis/rdf/v1#>
PREFIX image: <http://www.modeshape.org/images/1.0>
PREFIX sv: <http://www.jcp.org/jcr/sv/1.0>
PREFIX test: <info:fedora/test/>
PREFIX nt: <http://www.jcp.org/jcr/nt/1.0>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsi: <http://www.w3.org/2001/XMLSchema-instance>
PREFIX mode: <http://www.modeshape.org/1.0>
PREFIX xmlns: <http://www.w3.org/2000/xmlns/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX fedora: <http://fedora.info/definitions/v4/repository#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX jcr: <http://www.jcp.org/jcr/1.0>
PREFIX ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#>
PREFIX ldp: <http://www.w3.org/ns/ldp#>
PREFIX xs: <http://www.w3.org/2001/XMLSchema>
PREFIX fedoraconfig: <http://fedora.info/definitions/v4/config#>
PREFIX mix: <http://www.jcp.org/jcr/mix/1.0>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX iiif: <http://iiif.io/api/image/2#>
PREFIX sc: <http://iiif.io/api/presentation/2#>
PREFIX exif: <http://www.w3.org/2003/12/exif/ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX oa: <http://www.w3.org/ns/oa#>
PREFIX cnt: <http://www.w3.org/2011/content#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX dctypes: <http://purl.org/dc/dcmitype/>
PREFIX doap: <http://usefulinc.com/ns/doap#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX svcs: <http://rdfs.org/sioc/services#>
PREFIX as: <http://www.w3.org/ns/activitystreams#>

INSERT { 
 <> <http://iiif.io/api/presentation/2#hasCanvases> _:c000 .
";
}

function addFooter() {
    return "} WHERE {}";
}

$seqend = $end*2;
$seq = makeSequence($start, $seqend);
buildStatement($seq);