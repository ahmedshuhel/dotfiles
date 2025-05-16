#!/bin/bash

# SSH Config
HOST="devenv"
USER="ubuntu"

# Ports from the image
PORTS=(3443 4000 5049 6443 7647 9443)

# AutoSSH Options
AUTOSSH_OPTIONS="-M 0 -o ServerAliveInterval=60 -o ServerAliveCountMax=3 -T -N"

# Construct the port forwarding string
PORT_FORWARDING=""
for PORT in "${PORTS[@]}"; do
	PORT_FORWARDING+=" -L $PORT:localhost:$PORT"
done

# Start AutoSSH with all port forwardings
echo "Starting AutoSSH tunnel for ports: ${PORTS[*]}"
/opt/homebrew/bin/autossh $AUTOSSH_OPTIONS $PORT_FORWARDING $USER@$HOST
