echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt-get install apache2 -y

echo "Welcome to $HOST" > /var/www/html/index.html

service apache2 restart