PID=$(pidof 'unrealircd')
if [[ -z "$PID" ]]
then
    cd ~/unrealircd/ && ./unrealircd start
else
    echo "UnrealIRCd($PID) is running"
fi

