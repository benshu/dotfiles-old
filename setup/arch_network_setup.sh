sudo pacman -S iwd

systemctl enable iwd
systemctl enable systemd-networkd
systemctl enable systemd-resolved

systemctl start iwd
systemctl start systemd-networkd
systemctl start systemd-resolved
tee -a /etc/iwd/main.conf <<EOF
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
EOF
