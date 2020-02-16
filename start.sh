#!/bin/zsh

mongoctl start cmp

tmuxp load -d localstack
tmuxp load -d antivirus
tmuxp load -d assets
tmuxp load -d sso
tmuxp load -d instance-manager
tmuxp load -d analytics-api
tmuxp load -d cmp
tmuxp load -d abcm
tmuxp load -d aqs
tmuxp load -d conf-mgmt
tmuxp load -d api-gateway
tmuxp load -d aqrp
tmuxp load -d pitchmanager
tmuxp load -d workrequest

