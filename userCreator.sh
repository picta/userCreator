#! /bin/bash
# Author: Daniel Rodríguez 
# Date: 27 / Sept / 2016
# Last modification by: Daniel Rodriguez Hernandez
# Last update date: 18 / Oct / 2017
#
# Comments:
# Tested on RHEL
# CAREFUL, modify the list of servers accurately; also modify the list of users directly on the for sentence.
# 

#List of servers
SERVERS="
team5.ld.com
myserver.com
"


for host in $SERVERS
do 


ssh -t -o StrictHostKeyChecking=no root@$host '
	hostname

	#List of users 
	for user in user1 user2 user3 user666

	do
		#Edit the following lines according to your own needs! you can create your own file content changer, removers, package updaters, etc.
		echo "Adding" $user;
		useradd -d /home/$user -m $user
		echo -e "just4now\njust4now\n" | passwd $user
	done


'
done


