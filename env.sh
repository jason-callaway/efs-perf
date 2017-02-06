#!/usr/bin/env bash

echo "****************************************"
echo "Are you running bash from ssh-agent?"
echo "Have you loaded your ssh key?"
echo "And don't forget your secrets directory."
echo "See README.md for details."
echo "****************************************"
echo

# Use the correct PYTHONPATH on Mac OS X
#if [ "$(uname -s)" == "Darwin" ]; then
#    export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages
#fi

# Read RHN info
printf "RHN username: "
read rhn_username
export rhn_username
printf "RHN password: "
read -s rhn_password
export rhn_password
echo
printf "RHN pool id: "
read rhn_pool
export rhn_pool
echo
printf "ec2_keypair: "
read ec2_keypair
export ec2_keypair
echo

# Load AWS credentials if they're in ~/.aws, otherwise prompt for them
# TODO make this support more than one keypair in .aws/credentials
if [ -f ~/.aws/credentials ]; then
    export aws_access_key=`grep ^aws_access_key_id ~/.aws/credentials | cut -d' ' -f3`
    export aws_secret_key=`grep ^aws_secret_access_key ~/.aws/credentials | cut -d' ' -f3`
else
    printf "aws_access_key: "
    read aws_access_key
    export aws_access_key
    printf "aws_secret_key: "
    read aws_secret_key
    export aws_secret_key
fi
