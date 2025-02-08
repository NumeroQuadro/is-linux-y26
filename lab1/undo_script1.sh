#!/bin/bash

sudo userdel u1
sudo userdel u2
sudo rm -rf /home/u1
sudo rm -rf /home/u2

sudo sed -i '/^u1:/d' /etc/passwd
sudo sed -i '/^u1:/d' /etc/passwd

