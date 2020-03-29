#!/bin/bash

# arrays of alphabets
cap=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
low=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# function to get the length of a word
function getLength {
	length=$(( (RANDOM % $1) + 1 ))
	echo $length	
}

# functions getNum is for getting the element of relevent array
function getNum {
	val=$(( (RANDOM % 26) + 1 ))
	echo $val
}

# function to obtian letter
function getLetters {
	if [[ $4 == "C" ]]; then
		wd=${cap[caplt]}
	fi
	if [[ $4 == "S" ]]; then
		wd=${low[caplt]}
	fi
	if [[ "$2" -ne "$3" ]]; then
		for ((i=0; i<$1; i++)); do
			letter=$(getNum)
			wd=$wd${low[letter]}
		done
	fi	
	echo $wd
}

clear
RANDOM=$$
num=$(( (RANDOM % 20) +1 ))
stlen=$(getLength "$num")
loop=1
while [[ "$loop" -le "$1" ]]; do

	for ((count=1; count<=stlen; count++)); do
		chlen=$(getLength "10")
		if [[ "$count" -eq 1 ]]; then
			caplt=$(getNum)
			balchlen=$((chlen-1))
			word=$(getLetters "$balchlen" "$caplt" "chlen" "C")
		else
			balchlen=$chlen
			word=$(getLetters "$balchlen" "$caplt" "chlen" "S")
		fi

		if (( count == stlen )); then
			printf "%s. " "$word"
		else
			printf "%s " "$word"
		fi
	done
	((loop++))
done
echo

