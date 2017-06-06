#!bin/bash
for((i =0 ; i < 10 ;i++);do
echo $(cat dev/urandom | tr -dc 'a-zA-Z0-9' | head -c10) | tee /home/user$i/delta/folder{1..10}/delta.txt > /dev/null
done
