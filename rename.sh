#!/bin/bash
lsblk > vg.txt
echo -e "\n\n" >> vg.txt

vg_orig_name=$(sudo vgs | grep -v VG | awk '{print $1}')
echo "Original VG name is:" >> vg.txt
echo $vg_orig_name >> vg.txt
echo -e "\n\n" >> vg.txt

vg_new_name="vg_otus"
sudo vgrename $vg_orig_name $vg_new_name
for i in "/etc/fstab" "/etc/default/grub" "/boot/grub2/grub.cfg"; do sudo sed -i "s/$vg_orig_name/$vg_new_name/g" $i; done
if [ $? -eq 0 ]; then echo "Volume group was successfully renamed" >> vg.txt; fi
sudo mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)