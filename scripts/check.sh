#!/bin/bash
SERVICE="services"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    echo "Starting $SERVICE"
    cd ~/services/bin && nohup ./services 2>&1 &
fi
