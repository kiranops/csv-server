#!/bin/bash

count=1
default_count=10

echo > ./inputFile

while [ $count -le $default_count ]
do

	random=$(shuf -i 1-1000 -n2 | sort -n)
	first=$(echo $random | cut -f1 -d ' ')
	second=$(echo  $random | cut -f2 -d ' ')

	echo "$first, $second" >> ./inputFile
	count=$(( $count + 1 ))

done

sed -i '1d' ./inputFile

