PID=$(pidof 'services')
if [[ -z "$PID" ]]
then
    echo "iRC Services($PID) is not running"
    cd ~/services/bin && ./services
else
    echo "iRC Services($PID) is running"
fi

