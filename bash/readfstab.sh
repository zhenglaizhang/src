#!/bin/bash
# reading lines in /etc/fstab.

File=/etc/fstab

{
read line1
read line2
} < $File 


echo "first line in $File is: "
echo "$line1"
echo "second line in $File is: "
echo "$line2"

exit 0