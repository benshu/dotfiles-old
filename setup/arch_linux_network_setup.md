[Arch Wiki - IWD](https://wiki.archlinux.org/index.php/Iwd#Installation)

```
sudo pacman -S iwd
```

## systemd-networkd

### Configure systemd to operate both wired and wireless connection
[Arch Wiki - Systemd-netowrkd](https://wiki.archlinux.org/index.php/Systemd-networkd#Basic_usage)

```
sudo tee -a /etc/systemd/network/20-wired.network <<EOF
[Match]
Name=enp0s31f6

[Network]
DHCP=yes

[DHCP]
RouteMetric=10
EOF

sudo tee -a /etc/systemd/network/25-wireless.network <<EOF
[Match]
Name=wlan0

[Network]
DHCP=yes

[DHCP]
RouteMetric=20
EOF

```
- Enable systemd networking services
```
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl start systemd-networkd
systemctl start systemd-resolved
```

## iwd configuration

- enable iwd builtin DHCP
- enable DNS resolving by systemd

```
sudo tee -a /etc/iwd/main.conf <<EOF
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
EOF
```

```
systemctl enable iwd
systemctl start iwd
```

