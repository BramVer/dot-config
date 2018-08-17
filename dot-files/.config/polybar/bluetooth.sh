#!/bin/bash

icon_enabled=""
icon_disabled=""
tempstatus=`bluetoothctl`

case "$1" in 
    --toggle)
        if [[ $tempstatus == "bluetooth = on" ]]
        then 
            exec bluetoothctl off
            tempstatus=""
        else 
            exec bluetoothctl on
            tempstatus="bluetooth = on"
        fi   
        ;;
esac


if [[ $tempstatus == "bluetooth = on" ]]
    then
        echo "%{F#17a086}$icon_enabled"
    else 
        echo "%{F#33}$icon_disabled"
    fi

