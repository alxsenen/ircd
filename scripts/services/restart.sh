#!/bin/bash
#SERVICE="services"
#if pgrep -x "$SERVICE" >/dev/null
#then
#    echo "$SERVICE is running"
#else
#    echo "$SERVICE stopped"
#    echo "Starting $SERVICE"
#    cd ~/services/bin && nohup ./services 2>&1 &
#fi

PID=$(pidof 'services')
if [[ -z "$PID" ]]
then
    echo "iRC Services($PID) is not running"
    cd ~/services/bin && ./services
else
    echo "iRC Services($PID) is running"
    echo "Stopping iRC Services($PID)"
    kill -9 $PID
    cd ~/services/bin && ./services
fi

