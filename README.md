# ⚙️ Exo Components Generator Macro — *Tom Clancy’s The Division® 2* (AutoHotkey)

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

It’s primarily intended for players who already completed the game and want to automate exotic component farming on a secondary account.

---

## 🧩 Requirements

1. **Ultimate Edition** with **Year One Pass**  
2. Purchase the **Deluxe Pack** in the in-game store  
   - `ESC → Store → Add-ons → Deluxe Pack`
3. Free up **one empty agent slot** on the main agent selection screen  
4. Use **default key mappings** (no custom controls)  
5. The **rightmost existing agent** must be placed in the safe house **"The Shop"**  
6. Set inventory sorting to **"Recent"** (clock icon)  
7. Start the macro when a **blank agent slot** is selected on the main agent selection screen  

---

## ⚙️ Game Setup & Assumptions

- Keyboard layout: **QWERTY / DE** (default)
- The script depends on **timed key presses** (`Sleep`, `Send`)  
- There are **no safety checks, failsafes, or UI validations**
- Load times vary between systems — you may need to **increase sleep delays**

---

## 🪟 Window Target Selection

The script supports **three modes** depending on how you run The Division 2.

Uncomment **one** of the following lines and comment out the others:

### 🖥️ Native Division 2 (Windows)
```ahk
WinActivate, Tom Clancy's The Division 2
