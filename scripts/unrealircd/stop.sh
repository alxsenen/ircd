#!/bin/bash
PID=$(pidof 'unrealircd')
if [[ -z "$PID" ]]
then
    echo "UnrealIRCd($PID) is running"
else
    echo "UnrealIRCd($PID) is running"
    echo "UnrealIRCd($PID) is stopping"
    cd ~/unrealircd/ && ./unrealircd stop
fi

