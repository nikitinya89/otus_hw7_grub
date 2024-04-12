#!/bin/bash
mkdir /usr/lib/dracut/modules.d/01test
sudo cp /vagrant/module-setup.sh /usr/lib/dracut/modules.d/01test/
sudo cp /vagrant/test.sh /usr/lib/dracut/modules.d/01test/
sudo mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)
sudo sed -i 's/ rhgb quiet//g' /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg