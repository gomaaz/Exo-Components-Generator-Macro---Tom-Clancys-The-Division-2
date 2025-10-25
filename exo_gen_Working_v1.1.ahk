; Exo Flow (Overlay + F-Keys + F2 Toggle) — AHK v1.1+
; F2 = Start/Stop (toggle) | F3 = Reload | F4 = Exit

#NoEnv
#SingleInstance, Force
SendMode, Input
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1
ListLines, Off

CoordMode, Tooltip, Relative

; -------------------- Supported window identifiers --------------------
GameTitle_Local := "Tom Clancy's The Division 2"
GameTitle_GFN   := "ahk_class CEFCLIENT ahk_exe GeForceNOW.exe"
;GameTitle_Test  := "ahk_exe sublime_text.exe ahk_pid 57848 ahk_id 266314"

; -------------------- Overlay configuration --------------------
OverlayTimeout := 800
OverlayAlpha   := 180
OverlayWidth   := 520
OverlayY       := 20
OverlayFont    := "Segoe UI"
OverlayFontSz  := 14

; -------------------- Detect & activate target window --------------------
if WinExist(GameTitle_Local)
    GameTarget := GameTitle_Local
else if WinExist(GameTitle_GFN)
    GameTarget := GameTitle_GFN
;else if WinExist(GameTitle_Test)
;    GameTarget := GameTitle_Test
else
{
    MsgBox, 48, Window not found
    , Could not detect any supported window.`n`nStart one of:`n- %GameTitle_Local%`n- %GameTitle_GFN%`n- %GameTitle_Test%
    ExitApp
}

WinActivate, %GameTarget%
WinWaitActive, %GameTarget%,, 2
IfWinNotActive, %GameTarget%
{
    MsgBox, 48, Not active, Unable to activate target window.`n`n%GameTarget%
    ExitApp
}
WinMaximize, %GameTarget%


; -------------------- HUD (scrollable GUI info + non-overlapping F-key tooltips) --------------------
WinGetActiveStats, Title, WindowWidth, WindowHeight, WindowLeft, WindowTop

; Positions / layout (relative to the active game window)
TooltipX := Floor(WindowWidth * 0.05)      ; left margin ~5%
BaseY    := Floor(WindowHeight * 0.12)     ; top margin ~12%
Gap      := 10

; --- Multi-line info text ---
InfoText =
( LTrim Join`n                                  
 ___       __      ___       __       
|__  \_/ /  \    |__  |     /  \ |  | 
|___ / \ \__/    |    |___ \__/ |/\|                                                         

================================================
        EXO FLOW MACRO v1.1
        USE AT YOUR OWN RISK
================================================

This AutoHotkey script automates the process of farming Exotic Components by repeatedly:

- Creating a new agent
- Opening the starter cache
- Looting two Exotic weapons
- Deconstructing them for Exotic Components
- Deleting the character
- Repeating the process in a continuous loop

-----------------------------------------------------
WARNING: USE AT YOUR OWN RISK
This script creates and deletes characters in an endless loop.
Running it improperly can lead to complete character loss.
Do not run unattended.

The author assumes no responsibility for any data, character, or account loss.
This macro is purely experimental and provided as-is.
-----------------------------------------------------

Requirements:
1. You need the -Ultimate Edition- with the Year One Pass
2. Buy the -Deluxe Pack- in the in-game store
   (Esc - Store - Add-ons - Deluxe Pack)
3. Free up a clean agent slot on the selection screen
4. Set up the default key mapping
5. Place the rightmost agent in the safe house -The Shop-
6. Set inventory sorting to Recent (clock icon)
7. Check if you still have the gifts -Lullaby- and -Ruthless-.
   If so, deconstruct them first!
8. Start the script (F2) with a blank agent slot selected on the main agent selection screen

Notice:
Do not move the mouse while executing - unexpected behavior may occur.

)


; --- Scrollable Info GUI ---
Gui, InfoBox:Destroy
Gui, InfoBox:New, +AlwaysOnTop +ToolWindow +Border +OwnDialogs +HwndhInfo
Gui, InfoBox:Margin, 16, 14
Gui, InfoBox:Font, s10, Segoe UI

GuiW := 640                    ; GUI width
VisibleLines := 16             ; visible lines before scrolling
Gui, InfoBox:Add, Edit, w%GuiW% r%VisibleLines% vInfoEdit ReadOnly -Wrap VScroll, %InfoText%

Gui, InfoBox:Font, s10 Bold, Segoe UI
Gui, InfoBox:Add, Button, w100 h26 Default gInfoOK vInfoOKBtn Section, OK

; Show the GUI at a position relative to the active window
Gui, InfoBox:Show, x%TooltipX% y%BaseY% AutoSize, Exo Automation
GuiControl, Focus, InfoOKBtn   ; Enter/Space activates OK

; --- Compute F-key tooltip positions directly below the GUI (relative coords) ---
WinGetPos, gx, gy, gw, gh, ahk_id %hInfo%    ; screen coordinates of the GUI
RelNextY := (gy - WindowTop) + gh + Gap      ; convert to coords relative to active window (CoordMode Tooltip, Relative)

Tooltip, F2 - Start/Stop, %TooltipX%, %RelNextY%, 4
RelNextY += 22
Tooltip, F3 - Reload,     %TooltipX%, %RelNextY%, 5
RelNextY += 22
Tooltip, F4 - Exit,       %TooltipX%, %RelNextY%, 6

return

; --- Close handlers (OK / Esc / window close) ---
InfoOK:
Gui, InfoBox:Destroy
return

InfoBoxGuiEscape:
InfoBoxGuiClose:
Gosub, InfoOK
return



; -------------------- Overlay function (AHK v1-safe) --------------------
ShowStep(text, dur := "")
{
    global OverlayTimeout, OverlayAlpha, OverlayWidth, OverlayY, OverlayFont, OverlayFontSz
    if (dur = "")
        dur := OverlayTimeout

    Gui, StepOverlay:Destroy
    Gui, StepOverlay:New, +AlwaysOnTop +ToolWindow -Caption +LastFound +HwndhStep
    Gui, StepOverlay:Color, 000000
    WinSet, Transparent, %OverlayAlpha%, ahk_id %hStep%
    Gui, StepOverlay:Font, s%OverlayFontSz% cFFFFFF Bold, %OverlayFont%
    Gui, StepOverlay:Add, Text, Center w%OverlayWidth% h40, %text%
    Gui, StepOverlay:Show, NoActivate xCenter y%OverlayY%

    SetTimer, __HideOverlay, Off
    SetTimer, __HideOverlay, -%dur%
    return
}
__HideOverlay:
Gui, StepOverlay:Destroy
return

; -------------------- Focus helper --------------------
FocusTarget()
{
    global GameTarget
    WinActivate, %GameTarget%
    WinWaitActive, %GameTarget%,, 1
}

; ======================================================================
;                           MAIN SEQUENCE
; ======================================================================
RunExoSequence()
{
    ; ===================== Create Character =====================
    ShowStep("Create Character: wait for 'New Agent' button...")
    Sleep, 12000

    ShowStep("Create Character: push 'New Agent'")
    Send, {Space Down}
    Sleep, 300
    Send, {Space Up}
    Sleep, 300

    ShowStep("Create Character: select 'Main Campaign'")
    Send, {Space Down}
    Sleep, 766
    Send, {Space Up}

    ShowStep("Create Character: loading...")
    Sleep, 16968

    ShowStep("Create Character: 'Continue'")
    Send, {Space Down}
    Sleep, 150
    Send, {Space Up}
    Sleep, 100

    ShowStep("Create Character: move to 'Accept'")
    Loop, 5
    {
        Send, {s Down}
        Sleep, 50
        Send, {s Up}
        Sleep, 50
    }
    Sleep, 100

    ShowStep("Create Character: long-press accept")
    Send, {Space Down}
    Sleep, 2265
    Send, {Space Up}
    Sleep, 50

    ShowStep("Create Character: confirm")
    Send, {Space Down}
    Sleep, 94
    Send, {Space Up}
    Sleep, 2656

    ShowStep("Skip intro #1")
    Send, {f Down}
    Sleep, 1344
    Send, {f Up}
    Sleep, 15000

    ShowStep("Skip intro #2")
    Send, {f Down}
    Sleep, 1360
    Send, {f Up}
    Sleep, 3500

    ShowStep("Open pause menu")
    Send, {Escape Down}
    Sleep, 94
    Send, {Escape Up}
    Sleep, 1390

    ShowStep("Exit to menu")
    Send, {g Down}
    Sleep, 79
    Send, {g Up}
    Sleep, 50
    Send, {Space Down}
    Sleep, 78
    Send, {Space Up}

    ShowStep("Loading to menu...")
    Sleep, 35000

    ShowStep("Navigate one step left")
    Send, {y Down}
    Sleep, 109
    Send, {y Up}
    Sleep, 150

    ShowStep("Confirm")
    Send, {Space Down}
    Sleep, 94
    Send, {Space Up}

    ShowStep("Loading...")
    Sleep, 30000

    ; ===================== Move to stash in 'the shop' =====================
    ShowStep("Move: run right")
    Send, {d Down}
    Sleep, 2800
    Send, {d Up}
    Sleep, 50

    ShowStep("Move: forward")
    Send, {w Down}
    Sleep, 700
    Send, {w Up}
    Sleep, 50

    ShowStep("Move: left adjust")
    Send, {a Down}
    Sleep, 300
    Send, {a Up}

    ; ===================== Get exotics & deconstruct =====================
    Sleep, 500
    ShowStep("Interact at stash")
    Send, {f Down}
    Sleep, 484
    Send, {f Up}
    Sleep, 300

    ShowStep("Open cache")
    Send, {e Down}
    Sleep, 110
    Send, {e Up}
    Sleep, 300

    ShowStep("Navigate cache")
    Send, {d Down}
    Sleep, 94
    Send, {d Up}
    Sleep, 234
    Send, {Space Down}
    Sleep, 109
    Send, {Space Up}
    Sleep, 300

    ShowStep("Scroll down")
    Send, {s Down}
    Sleep, 100
    Send, {s Up}
    Sleep, 100
    Send, {s Down}
    Sleep, 109
    Send, {s Up}
    Sleep, 100
    Send, {s Down}
    Sleep, 94
    Send, {s Up}
    Sleep, 150
    Send, {s Down}
    Sleep, 25
    Send, {s Up}
    Sleep, 150
    Send, {s Down}
    Sleep, 110
    Send, {s Up}
    Sleep, 150

    ShowStep("Take exotic #1")
    Send, {f Down}
    Sleep, 78
    Send, {f Up}
    Sleep, 150

    ShowStep("Take exotic #2")
    Send, {f Down}
    Sleep, 94
    Send, {f Up}
    Sleep, 150

    ShowStep("Open Inventory (tab switch)")
    Send, {q Down}
    Sleep, 100
    Send, {q Up}
    Sleep, 150
    Send, {q Down}
    Sleep, 141
    Send, {q Up}
    Sleep, 350

    ShowStep("Select Primary Weapon")
    Send, {s Down}
    Sleep, 94
    Send, {s Up}
    Sleep, 100
    Send, {Space Down}
    Sleep, 109
    Send, {Space Up}
    Sleep, 150

    ShowStep("Move to exotic item")
    Send, {s Down}
    Sleep, 94
    Send, {s Up}
    Sleep, 150
    Send, {s Down}
    Sleep, 125
    Send, {s Up}
    Sleep, 150

    ShowStep("Mark both as junk")
    Send, {v Down}
    Sleep, 78
    Send, {v Up}
    Sleep, 150
    Send, {v Down}
    Sleep, 109
    Send, {v Up}
    Sleep, 150

    ShowStep("Deconstruct (hold)")
    Send, {Tab Down}
    Sleep, 1250
    Send, {Tab Up}
    Sleep, 100

    ShowStep("Dismiss dialog")
    Send, {Space Down}
    Sleep, 94
    Send, {Space Up}
    Sleep, 100

    ShowStep("Return to menu (3× Esc)")
    Loop, 3
    {
        Send, {Escape Down}
        Sleep, 109
        Send, {Escape Up}
        Sleep, 500
    }

    ShowStep("Quit to agent select")
    Send, {g Down}
    Sleep, 109
    Send, {g Up}
    Sleep, 50
    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}

    ShowStep("Loading to character select...")
    Sleep, 45000

    ; ===================== Delete Agent =====================
    ShowStep("Open delete menu (C)")
    Send, {c Down}
    Sleep, 125
    Send, {c Up}
    Sleep, 100

    ShowStep("Delete agent (hold X)")
    Send, {x Down}
    Sleep, 3437
    Send, {x Up}
    Sleep, 469

    ShowStep("Confirm delete")
    Send, {Space Down}
    Sleep, 78
    Send, {Space Up}
}

; ======================================================================
;                           HOTKEYS + TOGGLE
; ======================================================================
running := 0

; F2 — Start/Stop toggle
f2::
    if (running) {
        running := 0
        ShowStep("Stopping after current run...", 1000)
        return
    }
    running := 1
    ShowStep("Started (press F2 to stop)", 900)
    SetTimer, __MainLoop, Off
    SetTimer, __MainLoop, 10
return

; Timer-driven main loop (keeps hotkeys responsive)
__MainLoop:
    SetTimer, __MainLoop, Off
    FocusTarget()
    while (running) {
        ShowStep("Starting run...")
        RunExoSequence()
        if (!running)
            break
        ShowStep("Run complete. Restarting...", 900)
        Sleep, 300
    }
return

; F3 — Reload
f3::
    Reload
return

; F4 — Exit cleanly
f4::
    running := 0
    Send, {RButton up}
    Send, {x up}
    Send, {esc up}
    Tooltip
    Gui, StepOverlay:Destroy
    ExitApp
return
