# Jarkom-Modul-5-IT24-2024

| Nama | NRP |
|---|---|
|Amoes Noland|5027231028|
|Radella Chesa Syaharani|5027231064|

## Daftar Isi

- [Jarkom-Modul-5-IT24-2024](#jarkom-modul-5-it24-2024)
	- [Daftar Isi](#daftar-isi)
- [Misi 1: Memetakan Kota New Eridu](#misi-1-memetakan-kota-new-eridu)
	- [Soal 1: Topologi](#soal-1-topologi)
	- [Soal 2: VLSM](#soal-2-vlsm)
		- [Routing Table](#routing-table)
		- [Pembagian IP](#pembagian-ip)
	- [Soal 3: Subnetting/Routing](#soal-3-subnettingrouting)
		- [Subnetting](#subnetting)
			- [NewEridu (Router) - A1, A5](#neweridu-router---a1-a5)
			- [LuminaSquare (Router) - A1, A2, A3](#luminasquare-router---a1-a2-a3)
			- [Jane (Client) - A2, 200Host](#jane-client---a2-200host)
			- [Policeboo (Client) - A2, 30Host](#policeboo-client---a2-30host)
			- [HIA (Webserver) - A3](#hia-webserver---a3)
			- [BalletTwins (Router) - A3, A4](#ballettwins-router---a3-a4)
			- [Ellen (Client) - A4, 100Host](#ellen-client---a4-100host)
			- [Lycaon (Client) - A4, 20Host](#lycaon-client---a4-20host)
			- [SixStreet (Router) - A5, A6, A7](#sixstreet-router---a5-a6-a7)
			- [Fairy (DHCP) - A6](#fairy-dhcp---a6)
			- [HDD (DNS) - A6](#hdd-dns---a6)
			- [OuterRing (Router) - A7, A8](#outerring-router---a7-a8)
			- [Caesar (Client) - A8, 50Host](#caesar-client---a8-50host)
			- [Burnice (Client) - A8, 5Host](#burnice-client---a8-5host)
			- [ScootOutpost (Router) - A7, A9](#scootoutpost-router---a7-a9)
			- [HollowZero (Webserver) - A9](#hollowzero-webserver---a9)
		- [Routing](#routing)
			- [NewEridu (Router) - Selain A1, A5](#neweridu-router---selain-a1-a5)
			- [LuminaSquare (Router) - Selain A1, A2, A3, A5-9](#luminasquare-router---selain-a1-a2-a3-a5-9)
			- [BalletTwins (Router) - Selain A3, A4, A5-9](#ballettwins-router---selain-a3-a4-a5-9)
			- [SixStreet (Router) - Selain A1-4, A5, A6, A7](#sixstreet-router---selain-a1-4-a5-a6-a7)
			- [OuterRing (Router) - Selain A1-4, A7, A8](#outerring-router---selain-a1-4-a7-a8)
			- [ScootOutpost (Router) - Selain A1-4, A7, A9](#scootoutpost-router---selain-a1-4-a7-a9)
	- [Soal 4: Konfigurasi](#soal-4-konfigurasi)
		- [DHCP Server: dhcp-server.sh](#dhcp-server-dhcp-serversh)
		- [DHCP Relay: dhcp-relay.sh](#dhcp-relay-dhcp-relaysh)
		- [DNS Server: dns.sh](#dns-server-dnssh)
		- [Web Server: webserver.sh](#web-server-webserversh)
- [Misi 2: Menemukan Jejak Sang Peretas](#misi-2-menemukan-jejak-sang-peretas)
	- [Soal 1: IPTABLES](#soal-1-iptables)
		- [iptables.sh](#iptablessh)

# Misi 1: Memetakan Kota New Eridu

## Soal 1: Topologi

> Sebuah topologi sederhana menggambarkan jaringan New Eridu:
```
Keterangan:
HDD: Berfungsi sebagai DNS Server.
Fairy: Berfungsi sebagai DHCP Server.
Web Servers: HIA, HollowZero.
Client:
  Burnice: Memiliki 5 host.
  Lycaon: Memiliki 20 host.
  Policeboo: Memiliki 30 host.
  Caesar: Memiliki 50 host
  Ellen: Memiliki 100 host.
  Jane: Memiliki 200 host.
```

![GNS3](assets/topologi.jpeg)

## Soal 2: VLSM

> Setelah membagi alamat IP menggunakan VLSM, gambarkan pohon subnet yang menunjukkan hierarki pembagian IP di jaringan New Eridu. Lingkari subnet-subnet yang akan dilewati dalam jaringan.

### Routing Table

Nama Subnet | Rute | Jumlah IP | Netmask
---|---|---|---|
A1 | NewEridu > LuminaSquare | 2 | /30
A2 | NewEridu > LuminaSquare > PubSec > Policeboo + Jane | 231 | /24
A3 | NewEridu > LuminaSquare > Ofc.Mewmew > HIA + BalletTwins | 3 | /29
A4 | NewEridu > LuminaSquare > Ofc.Mewmew > BalletTwins > Victoria > Lycaon + Ellen | 121 | /25
A5 | NewEridu > SixStreet | 2 | /30
A6 | NewEridu > SixStreet > RandomPlay > HDD + Fairy | 3 | /29
A7 | NewEridu > SixStreet > Metro > ScootOutpost + OuterRing | 3 | /29
A8 | NewEridu > SixStreet > Metro > OuterRing > SoC > Caesar + Burnice | 56 | /26
A9 | NewEridu > SixStreet > Metro > ScootOutpost > HollowZero | 2 | /30
Total |  | 423 | /23

### Pembagian IP

Subnet | Network ID | Netmask | Broadcast | Range IP
---|---|---|---|---
A1 | 192.245.1.216 | 255.255.255.252 | 192.245.1.219 | 192.245.1.217 - 192.245.1.218
A2 | 192.245.0.0 | 255.255.255.0 | 192.245.0.255 | 192.245.0.1 - 192.245.0.254
A3 | 192.245.1.192 | 255.255.255.248 | 192.245.1.199 | 192.245.1.193 - 192.245.1.198
A4 | 192.245.1.0 | 255.255.255.128 | 192.245.1.127 | 192.245.1.1 - 192.245.1.126
A5 | 192.245.1.220 | 255.255.255.252 | 192.245.1.223 | 192.245.1.221 - 192.245.1.222
A6 | 192.245.1.200 | 255.255.255.248 | 192.245.1.207 | 192.245.1.201 - 192.245.1.206
A7 | 192.245.1.208 | 255.255.255.248 | 192.245.1.215 | 192.245.1.209 - 192.245.1.214
A8 | 192.245.1.128 | 255.255.255.192 | 192.245.1.191 | 192.245.1.129 - 192.245.1.190
A9 | 192.245.1.224 | 255.255.255.252 | 192.245.1.227 | 192.245.1.225 - 192.245.1.226

## Soal 3: Subnetting/Routing

> Setelah pembagian IP selesai, buatlah konfigurasi rute untuk menghubungkan semua subnet dengan benar di jaringan New Eridu. Pastikan perangkat dapat saling terhubung

### Subnetting

#### NewEridu (Router) - A1, A5

```
#NAT
auto eth0
iface eth0 inet dhcp
#A1
auto eth1
iface eth1 inet static
	address 192.245.1.217
	netmask 255.255.255.252
#A5
auto eth2
iface eth2 inet static
	address 192.245.1.221
	netmask 255.255.255.252
```

#### LuminaSquare (Router) - A1, A2, A3

```
#A1
auto eth0
iface eth0 inet static
	address 192.245.1.218
	netmask 255.255.255.252
	gateway 192.245.1.217
#A2
auto eth1
iface eth1 inet static
	address 192.245.0.1
	netmask 255.255.255.0
#A3
auto eth2
iface eth2 inet static
	address 192.245.1.193
	netmask 255.255.255.248
```

#### Jane (Client) - A2, 200Host

```
auto eth0
iface eth0 inet dhcp
```

#### Policeboo (Client) - A2, 30Host

```
auto eth0
iface eth0 inet dhcp
```

#### HIA (Webserver) - A3

```
#A3
auto eth0
iface eth0 inet static
	address 192.245.1.195
	netmask 255.255.255.248
  gateway 192.245.1.193
```

#### BalletTwins (Router) - A3, A4

```
#A3
auto eth0
iface eth0 inet static
	address 192.245.1.194
	netmask 255.255.255.248
  gateway 192.245.1.193
#A4
auto eth1
iface eth1 inet static
  address 192.245.1.1
	netmask 255.255.255.128
```

#### Ellen (Client) - A4, 100Host

```
auto eth0
iface eth0 inet dhcp
```

#### Lycaon (Client) - A4, 20Host

```
auto eth0
iface eth0 inet dhcp
```

#### SixStreet (Router) - A5, A6, A7

```
#A5
auto eth0
iface eth0 inet static
	address 192.245.1.222
	netmask 255.255.255.252
	gateway 192.245.1.221
#A6
auto eth1
iface eth1 inet static
	address 192.245.1.201
	netmask 255.255.255.248
#A7
auto eth2
iface eth2 inet static
	address 192.245.1.209
	netmask 255.255.255.248
```

#### Fairy (DHCP) - A6

```
#A6
auto eth0
iface eth0 inet static
	address 192.245.1.202
	netmask 255.255.255.248
	gateway 192.245.1.201
```

#### HDD (DNS) - A6

```
#A6
auto eth0
iface eth0 inet static
	address 192.245.1.203
	netmask 255.255.255.248
	gateway 192.245.1.201
```

#### OuterRing (Router) - A7, A8

```
#A7
auto eth0
iface eth0 inet static
	address 192.245.1.210
	netmask 255.255.255.248
	gateway 192.245.1.209
#A8
auto eth1
iface eth1 inet static
	address 192.245.1.129
	netmask 255.255.255.192
```


#### Caesar (Client) - A8, 50Host

```
auto eth0
iface eth0 inet dhcp
```

#### Burnice (Client) - A8, 5Host

```
auto eth0
iface eth0 inet dhcp
```

#### ScootOutpost (Router) - A7, A9

```
#A7
auto eth0
iface eth0 inet static
	address 192.245.1.211
	netmask 255.255.255.248
	gateway 192.245.1.209
#A9
auto eth1
iface eth1 inet static
	address 192.245.1.225
	netmask 255.255.255.252
```

#### HollowZero (Webserver) - A9

```
#A9
auto eth0
iface eth0 inet static
	address 192.245.1.226
	netmask 255.255.255.252
	gateway 192.245.1.225
```


### Routing

Untuk routing diperlukan sebuah script untuk dijalankan ketika mesin menyala, contoh:
`bash routing.sh` untuk dimasukkan `.bashrc`

#### NewEridu (Router) - Selain A1, A5

```bash
# Melewati A1: (A2-A4)
post-up route add -net 192.245.0.0 netmask 255.255.255.0 gw 192.245.1.218
post-up route add -net 192.245.1.192 netmask 255.255.255.248 gw 192.245.1.218
post-up route add -net 192.245.1.0 netmask 255.255.255.128 gw 192.245.1.218
# Melewati A5: (A6-A9)
post-up route add -net 192.245.1.200 netmask 255.255.255.248 gw 192.245.1.222
post-up route add -net 192.245.1.208 netmask 255.255.255.248 gw 192.245.1.222
post-up route add -net 192.245.1.128 netmask 255.255.255.192 gw 192.245.1.222
post-up route add -net 192.245.1.224 netmask 255.255.255.252 gw 192.245.1.222
```

#### LuminaSquare (Router) - Selain A1, A2, A3, A5-9

```bash
# Pulang
post-up route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.245.1.217
# A4
post-up route add -net 192.245.1.0 netmask 255.255.255.128 gw 192.245.1.194
```

#### BalletTwins (Router) - Selain A3, A4, A5-9

```bash
# Pulang (Termasuk A1 dan A2)
post-up route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.245.1.192
```

#### SixStreet (Router) - Selain A1-4, A5, A6, A7

```bash
# Pulang
post-up route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.245.1.221
# A8 dan A9
post-up route add -net 192.245.1.128 netmask 255.255.255.192 gw 192.245.1.210
post-up route add -net 192.245.1.224 netmask 255.255.255.252 gw 192.245.1.211
```

#### OuterRing (Router) - Selain A1-4, A7, A8

```bash
# Pulang
post-up route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.245.1.209
# A9
post-up route add -net 192.245.1.224 netmask 255.255.255.252 gw 192.245.1.211
```
#### ScootOutpost (Router) - Selain A1-4, A7, A9

```bash
# Pulang
post-up route add -net 0.0.0.0 netmask 0.0.0.0 gw 192.245.1.209
# A8
post-up route add -net 192.245.1.128 netmask 255.255.255.192 gw 192.245.1.210
```

## Soal 4: Konfigurasi

> Dikerjakan setelah Misi 2 Nomor 1:
* Fairy sebagai DHCP Server agar perangkat yang berada dalam Burnice, Caesar, Ellen, Jane, Lycaon, dan Policeboo dapat menerima IP secara otomatis
* OuterRing, BalletTwins, Sixstreet dan LuminaSquare Sebagai DHCP Relay
* HDD sebagai DNS Server
* HIA dan HollowZero sebagai Webserver (gunakan apache)

### DHCP Server: dhcp-server.sh
```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install isc-dhcp-server -y

echo '
INTERFACESv4="eth0"
INTERFACESv6=""
' > /etc/default/isc-dhcp-server

echo '
# Jane & Policeboo (A2)
subnet 192.245.0.0 netmask 255.255.255.0 {
  range 192.245.0.2 192.245.0.254;
  option routers 192.245.0.1;
  option broadcast-address 192.245.0.255;
  option domain-name-servers 192.245.1.203;
}
# Ellen & Lycaon (A4)
subnet 192.245.1.0 netmask 255.255.255.128 {
  range 192.245.1.2 192.245.1.126;
  option routers 192.245.1.1;
  option broadcast-address 192.245.1.127;
  option domain-name-servers 192.245.1.203;
}
# Caesar & Burnice (A8)
subnet 192.245.1.128 netmask 255.255.255.192 {
  range 192.245.1.130 192.245.1.190;
  option routers 192.245.1.129;
  option broadcast-address 192.245.1.191;
  option domain-name-servers 192.245.1.203;
}
# DHCP server
subnet 192.245.1.200 netmask 255.255.255.248 {}
' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```

### DHCP Relay: dhcp-relay.sh
```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install isc-dhcp-relay -y

# IP Fairy: 192.245.1.202
echo '
SERVERS="192.245.1.202"
INTERFACES="eth0 eth1 eth2 eth3"
OPTIONS=""
' > /etc/default/isc-dhcp-relay

echo '
net.ipv4.ip_forward=1
' > /etc/sysctl.conf

service isc-dhcp-relay restart
```

### DNS Server: dns.sh
```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install bind9 -y

echo 'options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    // dnssec-validation auto;

    allow-query { any; };
    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart
```

### Web Server: webserver.sh
```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install apache2 -y

echo "Welcome to $HOST" > /var/www/html/index.html

service apache2 restart
```

# Misi 2: Menemukan Jejak Sang Peretas

## Soal 1: IPTABLES

> Agar jaringan di New Eridu bisa terhubung ke luar (internet), kalian perlu mengkonfigurasi routing menggunakan iptables. Namun, kalian tidak diperbolehkan menggunakan MASQUERADE

### iptables.sh
Dengan command parsing untuk mendapatkan IP eth0 yang menggunakan dhcp:

```bash
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
ETH0_IP=$(ip -4 addr show eth0 | grep -oE '([0-9]{1,3}\.){3}([0-9]{1,3})' | head -n 1)
echo $ETH0_IP
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ETH0_IP
```