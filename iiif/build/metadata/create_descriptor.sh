#!/bin/bash
if (( $# < 2 )); then
    id=$1
fi
echo "<id>$id</id>" > "$id.xml"