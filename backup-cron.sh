#!/bin/bash

#source directory
src="src_cron"
# destination directory
dst="dst_cron"
# generating date format YYYY--MM--DD--HH--mm-SS
date=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H)-$(date +%M)-$(date +%S)

	ls -IR $src > $src/directory_info.new
	(cmp -s $src/directory_info.new $src/directory_info.last)
        if (( $? == 0 ))
        then
        	echo "no change"
        else 
                newdate=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H)-$(date +%M)-$(date +%S)
        	cp -r $src $dst
 		mv $dst/$src $dst/$newdate
 		ls -IR $src > $src/directory_info.last	

        fi	     
        	
