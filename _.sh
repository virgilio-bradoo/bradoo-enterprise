#!/bin/bash 

ADDONS_FILE="/repolist.txt"

while read -r line
do
	GIT_SSH_COMMAND='ssh -i /home/odoo/.ssh/id_rsa'	git clone $line 
done < "$ADDONS_FILE"
