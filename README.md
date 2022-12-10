# Shell Script to Backup a Directory
a bash script used to backup certain directory after given interval of time to ensure having a copy of the source directory

## Table of Content
* [Table of Content](#table-of-content)
  * [Code explanation](#explanation)
  * [Content](#content)
  * [Steps](#steps)
  * [Installation](#installation)
  * [Author](#author)
  
## Code explanation
- the code starts by validating :
1. Both directories has different names.
2. Time interval is positive integer
3. Maximum backup directories is positive integer.
- create two files to recognize the difference in the source directory
- saving date string
- generate vector of dates
- start the algorithm :
1. loop forever
2. sleep every time interval
3. check source directory and compare two files
4. create backup if needed
5. deleting redundant backups


## Content
The project file contains
1. backupd.sh file (bash script)
2. makefile.
3. README.md file.
4. cronjob bash script backup-cron.sh



## Steps
- You can run this script in two ways
1. run this command on the terminal inside the directory containing the script
> ./bashup.sh  (name of source file)  (name of backup directory) (time interval) (maximum backups)

- the code will run and if there is any invalid arguments you can change them through validations

2.run this command inside the directory containing the makefile
> make

- this will take all the arguments one by one and then validate if backup directory exists and if not create one

3. cronjob:
- user should write on terminal to modify the cronjob:
> crontab -e
- the terminal will give you choice to many text editors -choose default
- write your code in the form given on the last crontab file
 > minute hour day month week    your command
- "any" is referred here as "*" 
>ex: any minute in any day will be written as : * *

4. to run code of 3rd friday at 12 am 31
> 31 0 15-21 * fri  command
- or
> 31 0 15-21 * 5  command

-- explanation:
-          fri fri fri fri fri fri fri 
-     1st  1   2   3   4   5   6   7 
-     2nd  8   9   10  11  12  13  15
-     3rd  15  16  17  18  19  20  21
- so the range varies from 15 to 21 when it is friday
## Installation
- you must run this on any Linux based operating system
- you should have "make"installed on your machine
- to install make type this on terminal :
> sudo apt install make-guile



## Author
[Mohamed Farid](https://github.com/MohamedFarid612)


