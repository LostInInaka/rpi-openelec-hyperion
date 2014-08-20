#!/bin/sh
# Download image from - http://pibob.nadnerb.co.uk/images/hyperion.png
SERVICE='hyperiond'
if ps | grep -v grep | grep $SERVICE > /dev/null
then
killall hyperiond
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Disabled","image":"/storage/hyperion/hyperion.png"}}' http://127.0.0.1:8080/jsonrpc
else
/storage/hyperion/bin/hyperiond.sh /storage/.config/hyperion.config.json </dev/null >/dev/null 2>&1 &
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"id":1,"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Hyperion","message":"Enabled","image":"/storage/hyperion/hyperion.png"}}' http://127.0.0.1:8080/jsonrpc
fi
