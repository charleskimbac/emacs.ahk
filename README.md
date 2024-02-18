# emacs.ahk
This tiny script allows you to use the emacs-like key bindings on Windows, which is written in AutoHotkey (AHK) language.  
Removed: Window-specific keybind suspension, binds depending on C-c (duplicate of current line), Copy/Paste (M-w/C-y), Scroll up/down (M-v, C-v),	kill-emacs (C-x C-c)
Added: Image notification at top right of screen when emacs keybinds are active (when script is not suspended)

## Supported keybindings
<table>
  <tr>
    <th>Keybinding</th>
    <th>Emacs Lisp Function</th>
  </tr>
<tr>
<td>C-Space</td>
<td>set-mark-command</td>
</tr>
<tr>
<td>M-h</td>
<td>set-mark-command</td>
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
<td>C-h</td>
<td>delete-backward-char</td>
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
<td>C-g</td>
<td>quit</td>
</tr>
<tr>
<td>C-j</td>
<td>newline-and-indent</td>
</tr>
<tr>
<td>C-l</td>
<td>newline-emacs</td>
</tr>
<tr>
<td>C-m</td>
<td>newline</td>
</tr>
<tr>
<td>C-l</td>
<td>newline_emacs</td>
</tr>
<tr>
<td>M-i</td>
<td>indent-for-tab-command</td>
</tr>
<tr>
<td>C-i</td>
<td>indent-for-tab-command-invert</td>
</tr>
<tr>
<td>C-s</td>
<td>isearch-forward</td>
</tr>
<tr>
<td>C-r</td>
<td>isearch-backward</td>
</tr>
<tr>
<td>C-w</td>
<td>kill-region</td>
</tr>
<tr>
<td>C-/</td>
<td>undo</td>
</tr>
<tr>
<td>C-?</td>
<td>redo</td>
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
<td>win-=</td>
<td>text-scale-increase</td>
</tr>
<tr>
<td>win--</td>
<td>text-scale-decrease</td>
</tr>
<tr>
<td>F11</td>
<td>maximize or restore window</td>
</tr>
<tr>
<td>C-z, j</td>
<td>end-of-buffer</td>
</tr>
<tr>
<td>C-z, k</td>
<td>beginning of buffer</td>
</tr>
<tr>
<td>C-x, h</td>
<td>mark-whole-buffer</td>
</tr>
<tr>
<tr>
<td>C-x, C-;</td>
<td>toggle the comment of line</td>
</tr>
</table>

* Customized by Eason Huang
* Modifications by Charles Kim
  
## Toggle Input Method by Shift Key
Use Shift key for input method switch

## Update to AutoHotkey V2
Now this script only works for V2, tested on v2.0.10

## Usage
run `emacs.ahk` under [AutoHotkey](https://www.autohotkey.com/) v2.0 

## Automatic launch at Windows startup

* Win + R -> "shell:startup" -> place a shortcut to the script here  

* "C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -> place a shortcut to the script here
