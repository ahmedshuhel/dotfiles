#!/bin/bash
ps cax | grep autossh > /dev/null
if [ $? -eq 0 ]; then
  echo "lime is running."
else
  echo "lime is not running."
  nohup autossh -M 0  -T -N -f -F /Users/ahmedshuhel/.ssh/config svr &
fi
