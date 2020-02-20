PID=$(pidof 'services')
if [[ -z "$PID" ]]
then
    cd ~/services/bin/ && ./services
else
    echo "IRC Services($PID) is running"
fi

