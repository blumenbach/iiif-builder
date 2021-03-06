#!/bin/bash
if (( $# < 2 )); then
    id=$1
fi
echo "PREFIX premis: <http://www.loc.gov/premis/rdf/v1#>
PREFIX nt: <http://www.jcp.org/jcr/nt/1.0>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX svcs: <http://rdfs.org/sioc/services#>
PREFIX xsi: <http://www.w3.org/2001/XMLSchema-instance>
PREFIX sc: <http://iiif.io/api/presentation/2#>
PREFIX mode: <http://www.modeshape.org/1.0>
PREFIX pcdm: <http://pcdm.org/models#>
PREFIX oa: <http://www.w3.org/ns/oa#>
PREFIX xmlns: <http://www.w3.org/2000/xmlns/>
PREFIX blume: <http://purl.org/vocab/blumenbach#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX fedoraconfig: <http://fedora.info/definitions/v4/config#>
PREFIX mix: <http://www.jcp.org/jcr/mix/1.0>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dctypes: <http://purl.org/dc/dcmitype/>
PREFIX image: <http://www.modeshape.org/images/1.0>
PREFIX sv: <http://www.jcp.org/jcr/sv/1.0>
PREFIX test: <info:fedora/test/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX fedora: <http://fedora.info/definitions/v4/repository#>
PREFIX ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#>
PREFIX ldp: <http://www.w3.org/ns/ldp#>
PREFIX xs: <http://www.w3.org/2001/XMLSchema>
PREFIX exif: <http://www.w3.org/2003/12/exif/ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

DELETE { 
<> <http://www.w3.org/2003/12/exif/ns#height> \"2000\"^^<http://www.w3.org/2001/XMLSchema#integer> .
<> <http://www.w3.org/2003/12/exif/ns#width> \"1500\"^^<http://www.w3.org/2001/XMLSchema#integer> .
} WHERE {}" > "$id.ttl"