#!/bin/sh

# USAGE
# ./sshParalela public-dns-name
# 
# Shell script to connect via ssh from your local machine to the server
# Your script must reside in your local machine

# Before first use:
# 1. Place the keypair.pem file in a known local directory
# 2. Update your /path/to/your/key directory and your_username
# 3. Change permissions to make it executable
# 		sudo chmod +x sshParalela.sh

ssh -i ./CC3069-2022-seccion10.cer -o ServerAliveInterval=120 student10-10@$1
