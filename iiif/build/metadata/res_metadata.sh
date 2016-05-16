#!/bin/bash
if (( $# < 2 )); then
    id=$1
fi
echo "PREFIX premis: <http://www.loc.gov/premis/rdf/v1#>
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
<> <http://purl.org/dc/elements/1.1/format> \"image/jpeg\" .
<> <http://rdfs.org/sioc/services#has_service> <http://localhost:8888/iiif/base/$id> .
<> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://purl.org/dc/dcmitype/Image> .
<> <http://www.w3.org/2003/12/exif/ns#height> \"2048\"^^<http://www.w3.org/2001/XMLSchema#integer> .
<> <http://www.w3.org/2003/12/exif/ns#width> \"3125\"^^<http://www.w3.org/2001/XMLSchema#integer> .
} WHERE {}" > "$id.ttl"