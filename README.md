# emacs.ahk
This script allows you to use some emacs-like key bindings on Windows, which is written in the AutoHotkey (AHK) language.  

Additional features:
- A small translucent emacs logo appears at the top right of your screen while emacs keybinds are active (i.e. while the script is *not* suspended).
- Auto-suspend keybinds depending on current active window (must uncomment and edit code in emacs.ahk).

## Supported keybindings
<table>
  <tr>
    <th>Keybinding</th>
    <th>Emacs Lisp Function</th>
  </tr>
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
</table>

* Customized by Eason Huang
* Modifications by Charles Kim

## Usage
Run `emacs.ahk` under [AutoHotkey](https://www.autohotkey.com/) v2.0 

## Automatic launch at Windows startup

* Win + R → "shell:startup" → place a shortcut to the script here  

* "C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" → place a shortcut to the script here
