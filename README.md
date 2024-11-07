# emacs.ahk
This script allows you to use some emacs-like keybindings on Windows, which is written in the AutoHotkey (AHK) language.

## Additional features
- A small translucent emacs logo appears at the top right of your screen while the keybinds are active (i.e. while the script is *not* suspended)*
- Auto-suspend keybindings depending on the current active window (add your own `.exe`'s)*
- Disables the `F1` key
- Disables the `Insert` key
- Permanently enables `Num Lock`
  
*Enable/disable this feature at the top of `emacs.exe`

## Keybindings
C = Ctrl, S = Shift, M = Alt  
<table>
  <tr>
    <th>Keybinding</th>
    <th>Function</th>
  </tr>
  <tr>
    <td>C-x C-f</td>
    <td>find-file</td>
  </tr>
  <tr>
    <td>C-x C-s</td>
    <td>save-buffer</td>
  </tr>
  <tr>
    <td>C-d</td>
    <td>delete-char</td>
  </tr>
  <tr>
    <td>M-d</td>
    <td>delete-word</td>
  </tr>
  <tr>
    <td>C-k</td>
    <td>kill-line</td>
  </tr>
  <tr>
    <td>C-o</td>
    <td>open-line-emacs</td>
  </tr>
  <tr>
    <td>C-s</td>
    <td>isearch-forward</td>
  </tr>
  <tr>
    <td>C-a</td>
    <td>move-beginning-of-line</td>
  </tr>
  <tr>
    <td>C-e</td>
    <td>move-end-of-line</td>
  </tr>
  <tr>
    <td>C-p</td>
    <td>previous-line</td>
  </tr>
  <tr>
    <td>C-n</td>
    <td>next-line</td>
  </tr>
  <tr>
    <td>C-f</td>
    <td>forward-char</td>
  </tr>
  <tr>
    <td>C-b</td>
    <td>backward-char</td>
  </tr>
  <tr>
    <td>M-f</td>
    <td>forward-word</td>
  </tr>
  <tr>
    <td>M-b</td>
    <td>backward-word</td>
  </tr>
  <tr>
    <td>C-S-a</td>
    <td>select-all</td>
  </tr>
  <tr>
    <td>C-S-z</td>
    <td>redo</td>
  </tr>
  <tr>
    <td>C-S-k</td>
    <td>delete-line</td>
  </tr>
  <tr>
    <td>M-0</td>
    <td>👍</td>
  </tr>
  <tr>
    <td>M-p</td>
    <td>ctrl-p</td>
  </tr>
  <tr>
    <td>M-k</td>
    <td>ctrl-k</td>
  </tr>
  
</table>

## Usage
Run `emacs.ahk` with [AutoHotkey v2.0](https://www.autohotkey.com/).  
Suspend the script to temporarily disable the keybindings.

## Running at Windows startup
* WinKey + R → Enter "shell:startup" → Place a shortcut to the script here

* "C:\Users\\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" → Place a shortcut to the script here