#!/bin/bash
states=('California' 'Oregon' 'Hawaii' 'Washington' 'Nevada') 
for state in ${states[@]};
do
	echo $state
	if [ $state == "Hawaii" ];
	then
		echo "Hawaii is the best"
	fi
done
