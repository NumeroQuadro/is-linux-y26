#!/bin/bash

sudo userdel u1
sudo userdel u2
sudo groupdel g1
sudo groupdel testgroup
sudo rm -rf /home/u1
sudo rm -rf /home/u2

sudo sed -i '/^u1:/d' /etc/passwd
sudo sed -i '/^u2:/d' /etc/passwd

sudo chmod -R u-rwx,g-rwx,o-rwx /home/test13
sudo rm -rf /home/test13

sudo rm -f /etc/sudoers.d/u1-passwd
sudo sed -i '/\/usr\/bin\/mc/d' /etc/shells
sudo rm -f /etc/skel/readme.txt

sudo rm -rf /home/test13
sudo rm -rf /home/test14
sudo rm -rf /home/test15
sudo rm -f /home/test14/nano

