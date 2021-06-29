#!/bin/sh

set -e
xset s off dpms 0 10 0
#i3lock --color=4c7899 --ignore-empty-password --show-failed-attempts --nofork
i3lock-fancy
xset s off -dpms
