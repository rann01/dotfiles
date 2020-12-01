#!/bin/bash

# Current rotation stored in ~/.config/rotation because reasons 
ROTATION=$(cat ~/.config/rotation)

# Increment it through 0 (default) - 3
if [ $ROTATION -eq 1 ]
then
    ROTATION=2
elif [ $ROTATION -eq 2 ]
then
    ROTATION=3
elif [ $ROTATION -eq 3 ]
then
    ROTATION=0
else
    ROTATION=1
fi

# Apply rotation to xrandr
xrandr -o $ROTATION

# xsetwacom uses weird values, thus more if/elif/elses
if [ $ROTATION -eq 1 ]
then
    xsetwacom set 12 Rotate 2
elif [ $ROTATION -eq 2 ]
then
    xsetwacom set 12 Rotate 3
elif [ $ROTATION -eq 3 ]
then
    xsetwacom set 12 Rotate 1
else
    xsetwacom set 12 Rotate 0
fi

# Write new rotation to file
echo $ROTATION > ~/.config/rotation
