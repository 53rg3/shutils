#!/bin/bash
# set -x # for debug
set -e

### DEFAULTS
KEY="/home/cc/.ssh/pns";
PORT="22"
BACKUP_SERVER_IP="116.203.157.127"

### Helper functions
function exit_with_error_msg {
    echo -e "\e[91m< $1\e[0m"
    exit 1
}

function confirm_with_yes {
    read -p "> Confirm with yes: " input
    if [[ ${input} != "yes" ]]; then
        exit_with_error_msg "Error, exiting. Got input: \"${input}\""
    fi
}


### GET INPUTS
echo -e "\n\e[33mEnter data:\e[0m"

read -p "> Host IP (mandatory): " input
if [[ ${input} == "" ]]; then
    exit_with_error_msg "Host is mandatory, exiting."
fi
HOST=${input}

read -p "> User (mandatory): " input
if [[ ${input} == "" ]]; then
    exit_with_error_msg "User is mandatory, exiting."
fi
USER=${input}

read -p "> Port (default = ${PORT}): " input
if [[ ${input} != "" ]]; then
    PORT=${input}
fi

read -p "> Path to public key (default = ${KEY}): " input
if [[ ${input} != "" ]]; then
    KEY=${input}
fi

read -p "> Admin Server IP (mandatory): " input
if [[ ${input} == "" ]]; then
    exit_with_error_msg "Admin Server IP is mandatory, exiting."
fi
ADMIN_SERVER_IP=${input}

read -p "> Backup Server IP (default = ${BACKUP_SERVER_IP}): " input
if [[ ${input} != "" ]]; then
    BACKUP_SERVER_IP=${input}
fi



### CONFIRM USER INPUT
echo -e "\n\e[33mCheck input:\e[0m"
echo -e "Host: \e[36m${HOST}\e[0m"
echo -e "User: \e[36m${USER}\e[0m"
echo -e "Port: \e[36m${PORT}\e[0m"
echo -e "Public key: \e[36m${KEY}\e[0m"
echo -e "Admin Server: \e[36m${ADMIN_SERVER_IP}\e[0m"
echo -e "Backup Server: \e[36m${BACKUP_SERVER_IP}\e[0m"
confirm_with_yes


### COPY SSH KEYS
echo -e "\n\e[33mExecuting ssh-copy-id...\e[0m"
ssh-copy-id -i ${KEY} -p ${PORT} ${USER}@${HOST}

### RUN PLAYBOOK
echo -e "\n\e[33mExecuting ansible-playbook...\e[0m"
ansible-playbook --ask-vault-pass --ask-become-pass --user=${USER} --inventory="${HOST}," --extra-vars "pna=${ADMIN_SERVER_IP} backup=${BACKUP_SERVER_IP}" playbook

### SHOW SUCCESS
echo -e "\n\e[32mDone. Exiting...\e[0m";



