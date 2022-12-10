#!/bin/bash
#time interval
time=$3
#source directory
src=$1
# destination directory
dst=$2
rm -r $dst
mkdir $dst



if [ "$src" = "$dst" ]
then
	while [ "$src" = "$dst" ]
	do
	echo "Source directory cannot have same name as destiantion !"
	echo "please enter a new destination name !"
	read dst
	done	
fi	


j=0
if (( $time > 0 ))
then
	echo "Valid time interval :D"
else
	
	until (( $time > 0 ))	
	do
		if [ $j -eq 0 ]
		then
			echo "INVALID INPUT !"	
			j=`expr $j + 1`
		fi	
		echo "please enter a valid integer bigger than 0 as time interval !" 
		read time	
	done	
	
fi

# back ups max val
max=$4
j=0
if (( $max > 0 ))
then
	echo "Valid maximum backups :D"
else
	until (( $max > 0 ))	
	do
		if [ $j -eq 0 ]
		then
			echo "INVALID INPUT !"	
			j=`expr $j + 1`
		fi
		echo "please enter a valid integer bigger than 0 as maximum backups !" 
		read max	
	done		
fi
# generating date format YYYY--MM--DD--HH--mm-SS
date=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H)-$(date +%M)-$(date +%S)
cnt=1
cp -r $src $dst
mv $dst/$src $dst/$date
cd $src
touch directory_info.last
touch directory_info.new
cd ..
ls -IR $src > $src/directory_info.last

vector=()
vector+=($date)
for element in ${vector[@]}
do
	echo $element
done	
next_deleted=0
while true
do
	sleep $time
	ls -IR $src > $src/directory_info.new
	(cmp -s $src/directory_info.new $src/directory_info.last)
        if (( $? == 0 ))
        then
        	echo looping
        else 
                newdate=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H)-$(date +%M)-$(date +%S)
        	vector+=($newdate)
        	cnt=`expr $cnt + 1`
        	if (($cnt>$max))
        	then
        		rm -r $dst/${vector[$next_deleted]}
        		unset vector[$next_deleted]
        		cnt=`expr $max + 1`
        		next_deleted=`expr $next_deleted + 1`
        	fi	
        	echo $cnt
        	cp -r $src $dst
 		mv $dst/$src $dst/$newdate
 		ls -IR $src > $src/directory_info.last	
 		echo change detected
		for el in ${vector[@]}
		do
	       		echo $el
		done		
        fi	     
        
done	
