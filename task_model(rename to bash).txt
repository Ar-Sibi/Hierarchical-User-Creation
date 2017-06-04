#!/bin/bash
for (( i = 0; i < 4; i++ )); do
groupadd group$i;
done
for (( i = 0; i < 10; i++ )); do
useradd -m -d /home/user$i user$i ;
for (( j = 0; j <=$(((2+i)/3)); j++ )); do
usermod -a -G  group$j user$i
done
x=$((($i+2)/3));
usermod -g group$x;
mkdir -p /home/user$i/delta/folder{1..10}
chmod -R 707 /home/user$i
chown g+s user$i:group$x /home/user$i/delta
for (( k = 1; k <= 10; k++ )); do
var=$(cat dev/urandom | tr -dc 'a-zA-Z0-9' | head -c10)
echo $var > /home/user$i/delta/folder$k/delta.txt
done
chmod -R 707 /home/user$i
done
