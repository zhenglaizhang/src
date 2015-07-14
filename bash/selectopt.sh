#!/bin/bash
Options="Hello Exit"
select opt in $OPTIONS; do
	if [ "$opt" = "Exit" ]; then
		echo done
		exit 0
	elif [ "$opt" = "Hello" ]; then
		echo Hello World
	else 
		clear
		echo bad option
	fi
done
