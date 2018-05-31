#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

wget "https://drive.google.com/uc?export=donwload&id=1RC4U-8OWLQgS0WhEpGqDfycCHPdci7KM" -O toIsodyn  
wget "https://drive.google.com/uc?export=donwload&id=1QnpBEaCbswwVsF8FkFP7vMjQhj6CRHp4" -O SW620c.zip

unzip SW620c.zip

rartimid.R -i toIsodyn -f SW620/ -l 3
rc=$?; 
if [[ $rc != 0 ]]; then 
	echo "R process failed with error $rc"
	exit $rc; 
fi

if [ ! -f SW620/mark3 ]; then
   	echo "File mark3 does not exist, failing test."
   	exit 1
fi

echo "stadyn runs with test data without error codes, all expected files created."
