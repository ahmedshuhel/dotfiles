#!/bin/zsh

mongoctl start cmp

tmuxp load -d antivirus
tmuxp load -d assets
tmuxp load -d sso
tmuxp load -d analytics-api
tmuxp load -d cmp
tmuxp load -d abcm
tmuxp load -d conf-mgmt
tmuxp load -d api-gateway
