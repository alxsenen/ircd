PID=$(pidof 'unrealircd')
if [[ -z "$PID" ]]
then
    echo "UnrealIRCd($PID) is restarting"
else
    cd ~/unrealircd/ && ./unrealircd restart
fi
