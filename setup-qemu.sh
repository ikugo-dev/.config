#!/usr/bin/env sh
sudo pacman -S \
    qemu-full \
    virt-manager \
    dnsmasq \
    polkit

sudo systemctl start libvirtd.service 
sudo systemctl enable libvirtd.service 
sudo systemctl start virtlogd.service 
sudo systemctl enable virtlogd.service 
sudo systemctl start polkit-agent-helper.socket 
sudo systemctl enable polkit-agent-helper.socket 
echo Enabled and started: \[libvirtd.service, virtlogd.service, polkit-agent-helper.socket\]

echo started network default with virsh
sudo virsh net-start default

printf 'firewall_backend = "iptables"' \
    | sudo tee /etc/libvirt/network.conf
echo Added \'firewall_backend = "iptables"\' to /etc/libvirt/network.conf

echo Make sure 'libvirt' is in your user group
echo Curent groups "$(groups "$USER")"
