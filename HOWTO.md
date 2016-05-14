# How to create a IIIF Presentation 2.0 API Data Model in Fedora

## Prerequisites:
- fcrepo serialization should be installed in karaf.  
- enable saving binaries to a directory accessible to djatoka (/media/fcrepo).

### 1. Create Containers in Fedora for the edition objects:  
 - root
- canvas
- sequence
- annotation
- list
- range
- layer
- res  
URI Pattern: <http://localhost:8080/fcrepo/rest/edition/{id}/{container}>  
`./create_base_objects.sh {id}`
 
### 2. stage TIFF files in a CLI accessible directory. (/media/staged/{id})
- Create upload script with this process.
- a. ls > tiffs.sh
- b. open tiffs.sh in editor
- c. change file names as required: to remove leading zeros use this regex:
-- Find: (.+?)(\d{3}.tif)
-- Replace: mv $1$2 $2
-- save as mv.sh, chmod 755 mv.sh, ./mv.sh
-- open mv.sh in editor
- d: add curl command with this regex:
-- Find: mv 00000(\d{3}.tif) .+?(tif)
-- Replace: curl -X PUT --upload-file $1 -H"Content-Type: image/jpeg" "http://localhost:8080/fcrepo/rest/edition/00027/res/$1"
- save as upload.sh, chmod 755 upload.sh

### 3. Upload binaries to Fedora res container
`./upload.sh` 

### 4. Create binary metadata (RDF)
- check image dimensions (i.e. 2112 x 3314)
- use the script res_metadata.sh by piping in the ids of all of the files.  
Create the batch script:
- ls > list.txt
- open list.txt 
-- Find: (.+?)(.tif)\n
-- Replace: ./res_metadata.sh $1\n
- save as build_res_ttl.sh

### 5. Patch binary metadata
`curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@{res_id}.ttl" "http://localhost:8080/fcrepo/rest/edition/{id}/res/{res_id}.tif/fcr:metadata"`

Note: If a property exists, you must first delete it before you use SPARQL update!

Example:  
```sparql
DELETE { 
<> <http://www.w3.org/2003/12/exif/ns#height> \"2000\"^^<http://www.w3.org/2001/XMLSchema#integer> .
<> <http://www.w3.org/2003/12/exif/ns#width> \"1500\"^^<http://www.w3.org/2001/XMLSchema#integer> .
} WHERE {}" > "$id.ttl"
```

### 6. Create xml file descriptors
- file descriptor has one element <id>{edition_id}/001</id> that is used by the IIIF server for the URI
- use build_descriptors.sh then move the descriptors into the binary directory (/media/fcrepo/edition/{edition_id}/res

### 7. Ingest images into Djatoka
`curl -s 'http://localhost:8888/ingest?unattended=true'`

### 8. Create list objects
- Each list object will eventually contain the metadata about an image resource (perhaps a pointer to the TEI).
- The lists must preceed the creation of the canvas.  
Example:
`curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/{id}/list/l001"`  
URI pattern:  
<http://localhost:8080/fcrepo/rest/edition/{id}/list/l{list_id}>
- Use create_list_objects.sh script

### 9. Create canvas objects
- This is the same as the list creation.  
URI pattern:   
<http://localhost:8080/fcrepo/rest/edition/{edition_id}/canvas/c{canvas_id}>

### 10. create canvas metadata (RDF)
- same as step 4 but use `./canvas_metadata.sh`
- save as build_canvas_ttl.sh

### 11. Patch canvas metadata
- use script `update_canvas_metadata.sh`  
Example:  
`curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@002.ttl" "http://localhost:8080/fcrepo/rest/edition/{id}/canvas/c002"`

### 12. Create sequence metadata (RDF)
- Use the script build/sequence_metadata.php
- append prefixes and SPARQL statement in output file (sequence.ttl)
- include before sequence chain this statement!  
```sparql
INSERT { 
 <> <http://iiif.io/api/presentation/2#hasCanvases> _:c002 .
```

### 13. Patch sequence object
- default sequence has path "http://localhost:8080/fcrepo/rest/edition/{id}/sequence/normal"  
Example:    
`curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@sequence.ttl" "http://localhost:8080/fcrepo/rest/edition/{id}/sequence/normal"`

### 14. Create Ranges
- a manual process that involves partitioning the canvases based on the textual divisions (chapters, etc.)
- sequence.ttl can be reused for this purpose because the node chain is the same.

### 15. Create Manifest Object
`curl -i -X PUT "http://localhost:8080/fcrepo/rest/edition/{id}/manifest"`

### 16. Edit manifest metadata (RDF) template
- template file is manifest.ttl

### 17. Patch manifest metadata (RDF)
`curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@manifest.ttl" "http://localhost:8080/fcrepo/rest/edition/{id}/manifest"`

### 18. Create collection and subcollection objects
- `curl -i -X PUT "http://localhost:8080/fcrepo/rest/collection/top"`
- `curl -i -X PUT "http://localhost:8080/fcrepo/rest/collection/blumenbach-editions"`
- `curl -i -X PUT "http://localhost:8080/fcrepo/rest/collection/blumenbach-objects"`

### 19. Edit collection metadata (RDF) template
- template file is collection.ttl

### 20. Patch collection metadata
- `curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@collection.ttl" "http://localhost:8080/fcrepo/rest/collection/top"`