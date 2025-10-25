# ⚙️ Exo Flow Macro — *Tom Clancy’s The Division® 2* (AutoHotkey)


---

<div align="center">
<img width="1024" height="1024" alt="Gemini_Generated_Image_ta37umta37umta37" src="https://github.com/user-attachments/assets/51fcb3ac-c675-4616-926a-7dff473a8dad" />


Demo<br/>
[![Exo Flow Macro Demo](https://img.youtube.com/vi/2wZPLVXWewE/hqdefault.jpg)](https://youtu.be/2wZPLVXWewE)

**▶️ Watch the Exo Flow Macro Demo on YouTube**

</div>
> ⚠️ **WARNING — USE AT YOUR OWN RISK**  
> This script **creates and deletes characters in an endless loop**.  
> Running it improperly can lead to **complete character loss**.  
> Do **not** run unattended.  
>  
> The author assumes **no responsibility** for any data, character, or account loss.  
> This macro is purely experimental and provided **as-is**.


---


## 📜 Description

This AutoHotkey script automates the process of farming **Exotic Components** by repeatedly:

1. Creating a **new agent**  
2. Opening the **starter cache**  
3. Looting two **Exotic weapons**  
4. **Deconstructing** them for Exotic Components  
5. **Deleting** the character  
6. Repeating the process in a **continuous loop**

One run takes ~3 minutes 25 seconds per run with 2 exos 
One hour approx 35 Exos

There is a chance, that the stash is empty in several runs. This won't hurt the process.

It’s primarily intended for players who already completed the game and want to automate exotic component farming on a secondary account.

---

## 📜 Usage

Just run the .exe, it will detect the game (or geforce now client) and will display the description as an overlay tooltip to the game.
From there you can start (F2), Stop/reload (F3) or Quit (F4) the script. 

The game needs to stay in focus! It will not work in the background. 
Unexpected behaviour could be the cause by switching to e.g. desktop back and forth. 
See below for best practices whith using in background.

You can make custom changes with the ahk file. 
Therefor you will need autohotkey v1 - https://www.autohotkey.com/download/

---

## 🧩 Requirements

Notice: All instructions are in the script / exe, there you will have the chance to precheck everything
1. You need the -Ultimate Edition- with the Year One Pass
2. Buy the -Deluxe Pack- in the in-game store
   (Esc - Store - Add-ons - Deluxe Pack)
3. Free up the 4th(!) slot with clean agent slot on the selection screen
4. Place the 3rd agent in slot into the safe house -The Shop-
5. Set inventory for sorting to Recent in the 3rd character (clock icon)
6. Reset the default key mapping, any custom won't work.
7. Check if you still have the gifts -Lullaby- and -Ruthless-.
   If so, deconstruct them first!
8. place the screen to the blank agent slot in the main agent selection screen
9. Start the script (Press F2)
10. You can stop everytime with F3 (reload) or F4 (exit)

---

## ⚙️ Game Setup & Assumptions

- The script depends on **timed key presses** (`Sleep`, `Send`)  
- There are **no safety checks, failsafes, or UI validations**
- Load times vary between systems — you may need to **increase sleep delays**

---

## 🪟 Auto Window Target Selection

The Process auto detects the native Tom Clancy window by default but also works with geforce now client. 
```ahk
WinActivate, Tom Clancy’s The Division® 2 bei GeForce NOW ahk_class Chrome_WidgetWin_1  ; uncomment for Geforce now running in Chrome Window
```

---

# Run Your Script in the Background Using RDP Wrapper

## Goal
Run your script in a background Windows session (no second physical device required) by creating a second local Windows account and connecting to it with **RDP Wrapper**.  
Start the game (or GeForce Now) in that session and run the script; you can then close the RDP window while the session continues running.

> **Note:** The script requires active window focus for input — this method provides a dedicated session where it can stay active independently.

---

## Overview
1. Create a **local (non-Microsoft)** user account in Windows.  
2. Install and configure **RDP Wrapper** to allow remote desktop connections to a second local session.  
3. Connect to the new local account (`127.0.0.2`), launch the game or GeForce Now, start the script, and then disconnect — the session will keep running in the background.

🔗 **RDP Wrapper Releases:** [https://github.com/sebaxakerhtc/rdpwrap/releases](https://github.com/sebaxakerhtc/rdpwrap/releases)

---

## Step 1 — Create a Local Windows Account
1. Click **Start** → **Settings**.  
2. Go to **Accounts** in the left-hand menu.  
3. Scroll to **Other users** and click **Add account**.  
4. Select **I don’t have this person’s sign-in information**.  
5. Click **Add a user without a Microsoft account**.  
6. Enter a username for the new account.  
7. Optionally, set a password (or leave it blank).

---

## Step 2 — Install and Configure RDP Wrapper
1. Download **RDP Wrapper** from the link above.  
2. Install and configure it according to the project instructions.  
3. After installation, choose a display resolution for the remote session if prompted.  
4. Connect to your local device using this address:
5. Log in with the username and password of your new local account.

> 💡 Use the provided example settings (see project screenshot) for best compatibility.

---

## Step 3 — Connect and Run the Script
1. Open your **RDP client** and connect to `127.0.0.2`.  
2. Log in with your local account credentials.  
3. Inside that remote session, launch the **game** or **GeForce Now** (GeForce Now uses fewer local resources).  
4. Start your **script** within this session — it will now have its own focused window.  
5. Close the RDP session window — the background session will keep running along with the script.

---

## Tips & Notes
- Ensure the local account has permission to run the game and the script.  
- If GPU resources are limited, prefer **GeForce Now** for streaming instead of running the game directly.  
- After major Windows updates, check the RDP Wrapper GitHub page for updated configuration files.  
- You can reconnect anytime to the background session using RDP to monitor or stop the script.

---
