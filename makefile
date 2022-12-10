lab2:
	@ echo "Welcome to OS-Lab2 \n"  ; \
	 echo "enter your source directory -a new directory will be created if not found"  ; \
	 read src ; \
	 echo "\n" ;\
	 if [ ! -d "./$$src" ]; then \
	         echo "source directory not found -- source directory created successfully" ; \
	         mkdir "$$src"; \
	         echo "\n" ;\
	 fi ; \
	 echo "enter your destination directory -a new one will be created if not found"; \
	 read dst ; \
	 echo "\n" ;\
	 if [ ! -d "./$$dst" ]; then \
		 echo "backup directory not found -- backup directory created successfully" ; \
	         mkdir "$$dst"; \
	         echo "\n" ;\
	 fi ; \
	 echo enter your time interval needed between every backup in seconds ; \
	 read time ; \
	 echo "\n" ;\
	 echo enter maximum backup files in destination directory ; \
	 read max ; \
	 echo "\nyour bash script will run now :D\n" ;\
	 ./backupd.sh $$src $$dst $$time $$max ; \
	 

