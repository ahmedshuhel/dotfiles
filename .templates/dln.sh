#!/bin/sh

BACKLOG=$1
DATE=$(date '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TOMORROW=$(date -d "tomorrow" '+%Y-%m-%d')
cat  << EOF
# $DATE

- [Previous](./$YESTERDAY.md)
- [Next](./$TOMORROW.md)

## Todo
EOF
