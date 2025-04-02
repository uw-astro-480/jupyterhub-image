#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Check if the SSH key already exists or create a new one
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
    echo "SSH key created."
fi

chmod 600 ~/.ssh/id_rsa
