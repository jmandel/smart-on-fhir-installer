#!/bin/bash

for i in *.xml; do 
   curl 'http://localhost:3000/?' \
        -H 'Content-Type: text/xml' \
        --data-binary @$i; 
done