#!/bin/bash

#******************************************************************************************
# Enlarge swap file script by Justin Mackie
# References
# https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-18-04
# https://bogdancornianu.com/change-swap-size-in-ubuntu/
#******************************************************************************************


#Check active swap status and available hard drive space on partition
printf "\n**** Check active swap permissions and status: ****\n\n"
ls -hl /swap.*
printf "\n"
swapon --show
printf "\n\n**** Check available hard drive space on partition: ****\n\n"
df -h
printf "\n"

#Give user option to continue script or exit
read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'

#User enters swap size.
printf "Enter desired swap size in Gigabytes.  For example, type \'8\' for 8 Gigbytes.\n"
read varname
printf "**** Swap size will be ${varname}G. ****\n\n"

#Turn off all swap processes
sudo swapoff -a

#Resize our swap to size in Gigabytes.  Ex. 10G
sudo fallocate -l ${varname}G /swap.img

#Verify swap file size
ls -hl /swap.img

#Mark the file as swap
sudo mkswap /swap.img

#Activate swap file
sudo swapon /swap.img

#Verify swap is available
sudo swapon --show


