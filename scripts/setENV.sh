#!/bin/bash

export AWS_ACCESS_KEY_ID=$1
export AWS_ACCESS_SECRET=$2
sudo apt install python3-pip -y
pip3 install python-dotenv
python3 /home/ubuntu/.scripts/configENV.py $AWS_ACCESS_KEY_ID $AWS_ACCESS_SECRET