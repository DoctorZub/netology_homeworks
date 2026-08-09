#!/bin/bash

if [[ $# -ne 2 ]];then
	echo "Ошибка! Ожидалось 2 аргумента"
	exit 1
fi

if [[ $1 == crypt ]];then
	echo "Encrypting..."
	echo $2 | base64
elif [[ $1 == decrypt ]];then
	echo "Descypting..."
	echo $2 | base64 -d
else
	echo "Недопустимый аргумент. Ожидалось crypt или decrypt"
	exit 2
fi
