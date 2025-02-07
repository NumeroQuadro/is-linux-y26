#!/bin/bash
echo "results: " < "work3.log"

# 1) ------------------------------------------------------------------------
while IFS=: read -r username _ id _ ; do
	#echo "goofy: $line"
	echo "user $username has $id id" >> "work3.log"
done < "/etc/passwd"

# 2) ------------------------------------------------------------------------
echo "password was changed $(chage -l root | grep -i "Last password change" | awk -F: '{print $2}') last time" >> "work3.log"

echo "dimon limon"

# 3) --------------------------------------------------------------------
echo "groups: $(awk -F: '{print $1}' /etc/group | tr '\n' ', ')" >> "work3.log"

# 4,5,6,7) ------------------------------------------------------------------
sudo useradd -m -k /home/dimonlimon/is-linux-y26/lab1/useradd_dir u1
echo "u1:123" | sudo chpasswd
sudo groupadd g1
sudo groupmod -U u1 -a g1

# 8) -------------------------------------------------------------------
user_id=$(id -u u1)
group_info=$(id -Gn u1 | tr ' ' ', ')
echo "u1 (id: $user_id) belongs to groups: $group_info" >> work3.log

# 10) -----------------------------------------------------------------
users_in_g1=$(getent group g1 | awk -F: '{print $4}')
echo "Users in group g1: $users_in_g1" >> work3.log

# 11) ----------------------------------------------------------------
sudo usermod -s /usr/bin/mc u1

# 12) ---------------------------------------------------------------
sudo useradd -m u2
echo "u2:321" | sudo chpasswd
