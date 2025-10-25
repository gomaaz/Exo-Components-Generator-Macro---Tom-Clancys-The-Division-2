# ⚙️ Exo Flow Macro — *Tom Clancy’s The Division® 2* (AutoHotkey)

> ⚠️ **WARNING — USE AT YOUR OWN RISK**  
> This script **creates and deletes characters in an endless loop**.  
> Running it improperly can lead to **complete character loss**.  
> Do **not** run unattended.  
>  
> The author assumes **no responsibility** for any data, character, or account loss.  
> This macro is purely experimental and provided **as-is**.

---

<div align="center">

[![Exo Flow Macro Demo](https://img.youtube.com/vi/2wZPLVXWewE/hqdefault.jpg)](https://youtu.be/2wZPLVXWewE)

**▶️ Watch the Exo Flow Macro Demo on YouTube**

</div>


---


## 📜 Description

This AutoHotkey script automates the process of farming **Exotic Components** by repeatedly:

1. Creating a **new agent**  
2. Opening the **starter cache**  
3. Looting two **Exotic weapons**  
4. **Deconstructing** them for Exotic Components  
5. **Deleting** the character  
6. Repeating the process in a **continuous loop**

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

