#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

wget "https://drive.google.com/uc?export=donwload&id=1D1nBB5paAxFbyLtOZuvj-qvxsHEN-aLZ" -O sw620 
wget "https://drive.google.com/uc?export=donwload&id=1Mbp6MeDhWvj-9AYKy1XiwMPao728JsPj" -O SW620.zip

unzip SW620.zip

rartimid.R -i sw620 -s SW620/

rc=$?; 
if [[ $rc != 0 ]]; then 
	echo "R process failed with error $rc"
	exit $rc; 
fi

if [ ! -f SW620/Alanine_C1C3_c ]; then
   	echo "File out_exchanged.csv does not exist, failing test."
   	exit 1
fi

echo "artimid runs with test data without error codes, all expected files created."

