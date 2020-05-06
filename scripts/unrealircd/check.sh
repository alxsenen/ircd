PID=$(pidof 'unrealircd')
if [[ -z "$PID" ]]
then
    ~/unrealircd/unrealircd start
else
    echo "UnrealIRCd($PID) is running"
fi

