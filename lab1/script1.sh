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

# 4,5,6) ------------------------------------------------------------------
sudo useradd -m -k /home/dimonlimon/is-linux-y26/lab1/useradd_dir u1
sudo passwd u1 | echo "123"
