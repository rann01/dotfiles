#!/bin/bash

# MIT License
# 
# Copyright (c) 2018 James Fenn
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
