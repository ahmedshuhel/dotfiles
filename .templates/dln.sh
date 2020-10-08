#!/bin/sh

BACKLOG=$1
DATE=$(date '+%Y-%m-%d')
YESTERDAY=$(date '+%Y-%m-%d' -d "$(date) - 1 day")
TOMORROW=$(date '+%Y-%m-%d' -d "$(date) + 1 day")
cat  << EOF
# $DATE

- [Previous](./$YESTERDAY.md)
- [Next](./$TOMORROW.md)

## Todo
EOF
