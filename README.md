# Quest 3 "One-Click" Wireless Streamer (2026 Stable Method) 🎮📺

This repository provides a reliable, flicker-free method to cast your **Meta Quest 3** to a PC or TV using **scrcpy** and **OBS Studio**. 

### 🛑 The Problem
Recent Quest 3 firmware updates (v70+) cause `scrcpy` to flicker or go black when using hardware-level cropping (`--crop`). This setup bypasses the bug by capturing the **full feed** stably and using **OBS** to handle the "beautification" (cropping and leveling).

---

## 🛠️ Phase 1: The Offline Setup
Download these two tools and keep the installers in your toolkit folder.

1. **scrcpy (v3.3.4 or newer):** [Download from GitHub](https://github.com/Genymobile/scrcpy/releases)  
   *Extract the .zip to a folder like `C:\scrcpy`.*
2. **OBS Studio:** [Download from OBSProject](https://obsproject.com/download)  
   *Install it normally. This will handle your widescreen crop and TV output.*

---

## 🔑 Phase 2: Switch to Developer Mode
You only need to do this once per Meta account.

1. **Register as a Dev:** Go to [dashboard.oculus.com](https://dashboard.oculus.com), log in, and create an "Organization" (pick any name).
2. **Verify:** Meta may ask for a phone number or credit card to verify your identity.
3. **Enable in App:** Open the Meta Horizon app on your phone:
   * **Menu** > **Devices** > **[Your Quest 3]** > **Headset Settings** > **Developer Mode**.
   * Toggle **Debug Mode** to **ON**.
4. **Reboot:** Restart your headset.

---

## 🔌 Phase 3: The "Plug-In" Handshake
Every time you restart your Quest, you must do this once to enable wireless commands.

1. Connect your Quest 3 to your PC via USB-C.
2. Put the headset on and select **"Always allow USB debugging from this computer"**.
3. Open your scrcpy folder, click the address bar, type `cmd`, and hit Enter.
4. Type: `adb tcpip 5555`
5. **Unplug the cable.** You are now ready for wireless.

---

## 📶 Phase 4: Wireless One-Button Mode
Create a file named `QuestStream.bat` in your scrcpy folder. Paste the following code (update your IP address):

```batch
@echo off
title Quest 3 Wireless Streamer + OBS
echo ---------------------------------------
echo 1. Connecting to Quest 3...
:: Replace with your Quest's IP found in Headset Settings > Wi-Fi
adb connect 10.0.6.30:5555

echo 2. Launching OBS Studio...
start "" "C:\Users\Public\Desktop\OBS Studio.lnk"

echo 3. Launching Scrcpy...
scrcpy --window-title "Quest3Full" --video-codec=h264 --video-bit-rate=12M --max-fps=60 -m 1600 --video-buffer=5 --no-audio

echo ---------------------------------------
echo Stream closed.
pause
```
## 🎨 Phase 5: OBS "TV-Ready" Cleanup
Since we aren't cropping in scrcpy to avoid flickers, we do it in OBS:
1. Add Source: Create a Window Capture source and select the Quest3Full window.
2. Add Crop Filter: Right-click the source > Filters > + > Crop/Pad.
  Right: 800 (Removes the right eye).
  Top/Bottom: 225 (Centers the 16:9 widescreen view).
3. Fix the Tilt: Right-click source > Transform > Edit Transform.
  Set Rotation to -22 (fixes the Quest 3 downward camera angle).
4. Cast to TV: Right-click the OBS Preview > Fullscreen Projector > Select your TV monitor.

💡 Troubleshooting Tips
- Flickering? Ensure you aren't using the --crop flag in your .bat file. Let OBS do the cropping!
- Laggy? Ensure your Quest is on 5GHz or 6GHz Wi-Fi and your PC is on Ethernet.
- IP Changed? If the script fails, check your Quest Wi-Fi settings to see if your IP address changed.
