#!/bin/sh

DATE=$(date '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TOMORROW=$(date -d "tomorrow" '+%Y-%m-%d')
cat  << EOF
# $DATE

- [Previous]($1)

## Todo
EOF
