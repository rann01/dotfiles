#!/usr/bin/env bash
tmpbg="/tmp/screen.png"
scrot "$tmpbg"; corrupter -add 10 "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg"; rm "$tmpbg"