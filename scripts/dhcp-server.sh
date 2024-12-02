echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install isc-dhcp-server netcat -y

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