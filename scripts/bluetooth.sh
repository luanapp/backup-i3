#!/bin/bash

MAC="94:DB:56:EA:A6:90"
##
# to connect:
# bluetoothctl
# connect 94:DB:56:EA:A6:90
##

CARD_INDEX=$(pactl list cards short | grep "${MAC//:/_}" | awk '{print $1}')
pacmd set-card-profile $CARD_INDEX a2dp_sink_aac

