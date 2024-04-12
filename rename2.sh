#!/bin/bash
echo "New VG name is:" >> vg.txt
vg_name=$(sudo vgs | grep -v VG | awk '{print $1}')
echo $vg_name >> vg.txt
echo -e "\n\n" >> vg.txt
lsblk >> vg.txt
