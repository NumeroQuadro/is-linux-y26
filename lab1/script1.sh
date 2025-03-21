#!/bin/bash
echo "results: " < "work3.log"

# 1) ------------------------------------------------------------------------
while IFS=: read -r username _ id _ ; do
	#echo "goofy: $line"
	echo "user $username has $id id" >> "work3.log"
done < "/etc/passwd"

# 2) ------------------------------------------------------------------------
echo "password was changed $(chage -l root | grep -i "Last password change" | awk -F: '{print $2}') last time" >> "work3.log"

# 3) --------------------------------------------------------------------
echo "groups: $(awk -F: '{print $1}' /etc/group | tr '\n' ', ')" >> "work3.log"

# 4,5,6,7) ------------------------------------------------------------------
sudo cp readme.txt /etc/skel/ # sudo rm -rf /etc/skel/readme.txt
sudo useradd -m u1 # sudo userdel u1; sudo rm -rf /home/u1 
echo "u1:123" | sudo chpasswd # sudo userdel u1
sudo groupadd g1
sudo usermod -aG g1 u1

# 8) -------------------------------------------------------------------
user_id=$(id -u u1)
group_info=$(id -Gn u1 | tr ' ' ', ')
echo "u1 (id: $user_id) belongs to groups: $group_info" >> work3.log

# 10) -----------------------------------------------------------------
users_in_g1=$(getent group g1 | awk -F: '{print $4}')
echo "Users in group g1: $users_in_g1" >> work3.log

# 11) ----------------------------------------------------------------
echo "adding new shell"

# check if /usr/bin/mc already exists in a file
echo "/usr/bin/mc" | sudo tee -a /etc/shells # add new shell to list of allowed shells
# sudo usermod -s /usr/bin/mc u1 # somehow delete entry from shells list

# 12) ---------------------------------------------------------------
sudo useradd -m u2 # userdel u2; sudo rm -rf u2
echo "u2:321" | sudo chpasswd

# 13) ----------------------------------------------------------------
sudo mkdir -p /home/test13
sudo cp work3.log /home/test13/work3-1.log
sudo cp work3.log /home/test13/work3-2.log

# 14) -------------------------------------------------------------------
sudo groupadd testgroup
sudo usermod -aG testgroup u1
sudo usermod -aG testgroup u2
sudo chown u1:testgroup /home/test13
sudo chmod u+rw,g+rx,o-rwx /home/test13
sudo chmod u+rw,g+r,o-r /home/test13/*

# 15) -----------------------------------------------------------
sudo mkdir -p /home/test14
sudo chown u1:u1 /home/test14
sudo chmod u+rwx,g+rwx,o+rwx,+t /home/test14

# 16) -----------------------------------------------------
sudo cp /bin/nano /home/test14/nano
sudo chmod u+rwx,g+rx,o+rx /home/test14/nano

# 17) ------------------------------------------------------------------
sudo mkdir -p /home/test15
sudo touch /home/test15/secret_file
sudo chmod u+rwx,g-rwx,o-rwx /home/test15
sudo chmod u+rw,g-rwx,o-rwx /home/test15/secret_file

# 18) -----------------------------------------------------------
echo "u1 ALL=(ALL) NOPASSWD: /usr/bin/passwd" | sudo tee -a /etc/sudoers.d/u1-passwd
