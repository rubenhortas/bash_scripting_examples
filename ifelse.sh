#!/usr/bin/env bash

echo -n "Enter a number: "
read -r number

if [ "$number" -lt 100 ]; then
	echo "$number < 100"
else
	if [ "$number" -eq 100 ]; then
		echo "$number = 100"
	else
		echo "$number > 100"
	fi
fi
