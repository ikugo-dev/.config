#!/usr/bin/env sh


sudo pacman -S \
    qemu-base \
    virt-manager \
    polkit \
    dnsmasq \
    qemu-hw-display-virtio-gpu-pci-rutabaga \
    qemu-hw-display-virtio-gpu-rutabaga \
    qemu-hw-display-virtio-vga-rutabaga \
    qemu-hw-display-virtio-gpu-pci-gl \
    qemu-hw-display-virtio-gpu-pci \
    qemu-hw-display-virtio-gpu-gl \
    qemu-hw-display-virtio-vga-gl \
    qemu-hw-display-virtio-gpu \
    qemu-hw-display-virtio-vga


sudo systemctl start libvirtd.service 
sudo systemctl enable libvirtd.service 
sudo systemctl start virtlogd.service 
sudo systemctl enable virtlogd.service 
sudo systemctl start polkit-agent-helper.socket 
sudo systemctl enable polkit-agent-helper.socket 

sudo virsh net-start default

printf '\nfirewall_backend = "iptables"  ' \
    | sudo tee /etc/libvirt/network.conf


echo "Add 'libvirt' to user group"
groups "$USER"
