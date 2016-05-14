#!/bin/bash
if (( $# < 2 )); then
    id=$1
fi
echo "PREFIX ns001: <info:fedora/fedora-system:def/model#>
PREFIX ns003: <http://id.loc.gov/vocabulary/relators/>
PREFIX ns004: <http://www.w3.org/ns/auth/acl#>
PREFIX ns005: <info:fedora/fedora-system:def/relations-external#>
PREFIX ns006: <http://scholarsphere.psu.edu/ns#>
PREFIX premis: <http://www.loc.gov/premis/rdf/v1#>
PREFIX nt: <http://www.jcp.org/jcr/nt/1.0>
PREFIX pcdm: <http://pcdm.org/models#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsi: <http://www.w3.org/2001/XMLSchema-instance>
PREFIX sc: <http://iiif.io/api/presentation/2#>
PREFIX mode: <http://www.modeshape.org/1.0>
PREFIX oa: <http://www.w3.org/ns/oa#>
PREFIX xmlns: <http://www.w3.org/2000/xmlns/>
PREFIX blume: <http://purl.org/vocab/blumenbach#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX jcr: <http://www.jcp.org/jcr/1.0>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX fedoraconfig: <http://fedora.info/definitions/v4/config#>
PREFIX mix: <http://www.jcp.org/jcr/mix/1.0>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dctypes: <http://purl.org/dc/dcmitype/>
PREFIX image: <http://www.modeshape.org/images/1.0>
PREFIX sv: <http://www.jcp.org/jcr/sv/1.0>
PREFIX test: <info:fedora/test/>
PREFIX svcs: <http://rdfs.org/sioc/services#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX fedora: <http://fedora.info/definitions/v4/repository#>
PREFIX ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#>
PREFIX ldp: <http://www.w3.org/ns/ldp#>
PREFIX xs: <http://www.w3.org/2001/XMLSchema>
PREFIX exif: <http://www.w3.org/2003/12/exif/ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

INSERT { 
<> <http://iiif.io/api/presentation/2#hasImageAnnotations> _:c14n18 .
_:c14n18 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> _:c14n12 .
_:c14n12 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/ns/oa#Annotation> .
_:c14n12 <http://www.w3.org/ns/oa#hasBody> <http://localhost:8080/fcrepo/rest/edition/base/res/$id.tif> .
_:c14n12 <http://www.w3.org/ns/oa#hasTarget> <> .
_:c14n12 <http://www.w3.org/ns/oa#motivatedBy> <http://iiif.io/api/presentation/2#painting> .
_:c14n18 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
<> <http://iiif.io/api/presentation/2#hasLists> _:c14n7 .
_:c14n7 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://localhost:8080/fcrepo/rest/edition/base/list/l$id> .
_:c14n7 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
<> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://iiif.io/api/presentation/2#Canvas> .
<> <http://www.w3.org/2000/01/rdf-schema#label> \"S. $id\" .
<> <http://www.w3.org/2003/12/exif/ns#height> \"2112\"^^<http://www.w3.org/2001/XMLSchema#integer> .
<> <http://www.w3.org/2003/12/exif/ns#width> \"3314\"^^<http://www.w3.org/2001/XMLSchema#integer> .
} WHERE {}" > "c$id.ttl"