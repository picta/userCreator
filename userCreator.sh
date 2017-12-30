#! /bin/bash
# Author: Daniel Rodriguez 
# Date: 27 / Sept / 2016
# Last modification by: Daniel Rodriguez Hernandez
# Last update date: 29 / Dec / 2017
#
# Comments:
# Tested on RHEL, and AIX(fixed user, not the for)
# CAREFUL, modify the list of servers accurately; also modify the list of users directly on the for sentence.
# 

#List of servers
SERVERS="
server.com
server1.com
"

for host in $SERVERS
do 

echo "Here"

ssh -o StrictHostKeyChecking=no -o ConnectTimeout=7 root@$host '
	hostname

	if [[ `uname` == "AIX" ]]; then
		echo "Es AIX"

		#List of users 
		#for user in user1 user2 user3 user666

		#do
			#echo "Adding" $user;
			#Edit the following lines according to your own needs! you can create your own file content changer, removers, package updaters, etc.
			mkuser home="/home/user1/" gecos="user1 ; Administrator" user1
			id user1
			#Password set
			echo user1:just4now |chpasswd
			# Password change, or not 
			#pwdadm -c user1
			
		#done

	elif [[ `uname` == "Linux" ]]; then	
		echo "Es Linux"
		#List of users 
		for user in user1 user2 user3 user666

		do
			#Edit the following lines according to your own needs! you can create your own file content changer, removers, package updaters, etc.
			echo "Adding" $user;
			useradd -d /home/$user -m $user
			echo -e "just4now\njust4now\n" | passwd $user
		done
	fi

	echo "The_End"

'
done

