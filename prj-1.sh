#!/bin/bash


##########################################

# Author: Hritik

# this project include user_management,
# group management,backup script

# V1

##########################################




user_mng() (

add_user() (
	read -p "Enter username " username
	stty -echo
	read -p "Enter password " password
	stty echo
	echo
	sudo useradd -m $username
	echo "$username:$password" | sudo chpasswd
	echo "user $username created successfully"
)

delete_user() (
	read -p "Enter username to delete " username
	sudo userdel -f $username
)

modify_user() (
	read -p "Enter username to modify " username
	sudo passwd $username 

)



echo "User Management Script"
echo "1.add user"
echo "2.modify user"
echo "3.delete user"
read -p "Enter your choice " choice

case $choice in
	1) add_user ;;
	2) modify_user ;;
	3) delete_user ;;
	*) echo "invalid choice " ;;
esac
)



group_mng() (


add_group() (

read -p "Enter the group name " groupname
sudo groupadd $groupname
)

delete_group() (
read -p "Enter the group name " groupname
sudo groupdel $groupname
)

add_user_to_group() (
read -p "Enter the user name " user
read -p "Enter the groupname " grp
sudo gpasswd -a $user $grp
)

echo "Group Management "
echo "1.add group"
echo "2.add_user_to_group"
echo "3.delete group "
read -p "Enter your choice " choice

case $choice in
	1) add_group ;;
	2) add_user_to_group ;;
	3) delete_group ;;
	*) echo "invalid input" ;;
esac


)




backup() (

read -p "Enter the directory whoes backup is to be taken" sour_dir
read -p "Enter the directory where backup file is to dump" des_dir

backup_file=backup_$(date +%y-%m-%d_%H:%M:%S).tar.gz
tar -czvf $des_dir/$backup_file  $sour_dir

echo "backup completed : $des_dir/$backup_file"

echo "######### Menu ##########"
echo "1.backup"
read -p  "Enter your choice "  choice

case $choice in
	1) backup ;;
	*) echo "invalid choice "
esac

)




echo " ######### MainMenu #########"
echo " 1.user management "
echo " 2.group_management "
echo " 3.backup "
read -p "Enter your choice " ch

case $ch in 
	1) user_mng ;;
       	2) group_mng ;;
	3) backup ;;
	*) echo "please enter valid choice "
esac

		
