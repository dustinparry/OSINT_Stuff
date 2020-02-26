#!/bin/bash
# whats my name checker
# used to automate whatsmyname and grab user accounts

# Get username that you'll be searching for 
echo "Please enter username: "
read user

# Create folders for each user
mkdir /root/$user

# Change into whatsmyname directory so there aren't any weird issues
cd /root/WhatsMyName

# Run script with provided username, write to text fiel in the root directory
python3 web_accounts_list_checker.py -u $user > /root/$user/results.txt

# Grep for found users
cat /root/$user/results.txt | grep Found > /root/$user/Found.txt

#Export results with juste URLs
cat /root/$user/Found.txt | cut -d " " -f5 > /root/$user/urls.txt
