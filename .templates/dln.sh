#!/bin/sh

DATE=$1
YESTERDAY=$2

cat  << EOF
# $DATE

## Backlog

- [Previous](./$YESTERDAY.md)

## Todo

- [ ] Task 1
- [ ] Task 2

## Next

- TBD
EOF
