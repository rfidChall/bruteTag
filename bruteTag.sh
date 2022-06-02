#!/bin/bash

# Commands def

ECHO="/bin/echo"
OPENSSL="/usr/bin/openssl"

# file having candidates passwords
# TODO must add this as arguments
input="/pasth/to/passwords.txt"
encrypt="encrypted_data"

# TODO: add key encryption and modify command
UID="key_encryption" 

arra=()
while IFS= read -r line
	do
		arra+=("$line")
done < "$input"


for PASSWORD in "${arra[@]}"; do

	$ECHO $encrypt | $OPENSSL enc -d -aes-256-cbc -a -pass pass:$PASSWORD -nosalt 2>/dev/null
  	RET=$?

	if [ $RET -eq 0 ]; then
		echo "Candidate password: $PASSWORD"
	fi

done
