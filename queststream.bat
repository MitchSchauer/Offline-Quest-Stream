@echo off
title Quest 3 Wireless Streamer + OBS
echo ---------------------------------------
echo 1. Connecting to Quest 3...
:: Replace with your Quest's IP
adb connect 10.0.xx.xx:5555

echo 2. Launching OBS Studio...
:: This is the default path. If yours is different, update it here:
start "" "C:\Users\Public\Desktop\OBS Studio.lnk"

echo 3. Launching Scrcpy...
:: Your stable command
scrcpy --window-title "Quest3Full" --video-codec=h264 --video-bit-rate=12M --max-fps=60 -m 1600 --video-buffer=5 --no-audio

echo ---------------------------------------
echo Stream closed.
pause