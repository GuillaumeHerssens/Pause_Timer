#!/bin/bash
ctime=$(date +%H%M) # current time military time format
#ctime=1310
pause=( 900 1100 1230 1500 ) #list of hours when pauses start (+ start of day )

if [[ $ctime =~ ("0"[0-9]{3}$) ]];then ctime=${ctime: 1}
fi

for (( i = 0; i < ${#pause[@]}; i++ ))
do

	if [[ $ctime -lt ${pause[$i]} ]] && [[ $ctime -ge ${pause[$i-1]} ]];then 
	hour=$(( ${pause[$i]:0:2} - ${ctime:0:-2} ))
	min=$(( ${pause[$i]: -2} - ${ctime: -2} ))
	fail=1

		if [[ $min -lt 0 ]];then
		hour=$(( $hour - 1 ));min=$(( $min + 60 ))
		fi

	echo $hour"H"$min
	fi

done

if ! [[ $fail ]];then echo "No more pause today"
fi
