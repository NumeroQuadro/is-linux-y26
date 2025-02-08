#!/bin/bash

sudo userdel u1
sudo userdel u2
sudo groupdel g1
sudo rm -rf /home/u1
sudo rm -rf /home/u2

sudo sed -i '/^u1:/d' /etc/passwd
sudo sed -i '/^u2:/d' /etc/passwd


