#!/bin/bash
condaoutput=$(conda info --envs | sed '1,2d' | cut -d " " -f 1 )
envs=()
while IFS= read -r line
do
	envs+=( "$line" )	
	
done < <(printf '%s\n' "$condaoutput")


printf "The following conda environments can be activated: \n"

i=1
for ENVIRONMENT in "${envs[@]}"
do
	printf '\t[%s] %s\n' "$i" "$ENVIRONMENT"
	let i="${i}"+1
done

printf 'Choose the corresponding number and the rest will be taken care of.\n'
read -k 1 -r USERCHOICE

if (( USERCHOICE <= i && USERCHOICE != 0 ))
then
	$(conda activate "${envs[$USERCHOICE]}")
fi
