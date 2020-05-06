PID=$(pidof 'services')
if [[ -z "$PID" ]]
then
    ~/services/bin/services
else
    echo "IRC Services($PID) is running"
fi

