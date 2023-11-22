# PowerShell settings

Invoke-Expression (&starship init powershell)
Import-Module Terminal-Icons

#PSReadline settings
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -PredictionViewStyle InlineView
# Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Shift+Tab -Function TabCompletePrevious
# Set-PSReadlineKeyHandler -Key "Ctrl+w" -Function ViExit
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key Ctrl+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "Ctrl+k" -Function HistorySearchBackward

# Alias
Set-Alias v nvim
Set-Alias g LazyGit
Set-Alias ipy ipython
Set-Alias rename Rename-Item

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# 查看目录 ls & ll
function ListDirectory {
	(Get-ChildItem).Name
	Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

# Basic commands
function touch($file) { "" | Out-File $file -Encoding ASCII }
function q { exit }
function cdd {cd C:\Users\ThinkPad\Desktop}
function md { mkdir }
function rm { Reomve-Item }
function .. { cd .. }
function ... { cd ..; cd ..}
function .... { cd ..; cd ..; cd .. }
function ..... { cd ..; cd ..; cd ..; cd ..}

# 当前工作目录以我的电脑形式打开, o
function OpenCurrentFolder {
	param
	(
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name o -Value OpenCurrentFolder

function dt { cd '~/Desktop' }

# 修改 PSreadLine 历史记录, 删除错误的记录
# (Get-PSReadLineOption).HistorySavePath  可以获得历史记录文件路径
function edith { nvim -c 'normal! G' (Get-PSReadLineOption).HistorySavePath }

# ------------------- config files -------------------
# wezterm
function weconfig { nvim 'C:\Users\ThinkPad\.config\wezterm\config\appearance.lua' }
# alacritty
function alconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\alacritty\alacritty.yml' }
# powershell
function psconfig { nvim $PROFILE }
# starship
function ssconfig { nvim 'C:\Users\ThinkPad\Documents\PowerShell\starship.toml' }
# nvim
function vconfig { nvim 'C:\Users\ThinkPad\AppData\Local\nvim\init.lua' }
# windows terminal
function wtconfig { nvim 'C:\Users\ThinkPad\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json' }
# lf
function lfconfig { nvim 'C:\Users\ThinkPad\AppData\Local\lf\lfrc' }
# goneovim
function goconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\.goneovim\settings.toml' }

# ------------------- lf -------------------
# lfcd
# 同步powershell与退出lf时的路径一致
Set-PSReadLineKeyHandler -Chord Ctrl+f -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadline]::RevertLine()
    [Microsoft.Powershell.PSConsoleReadline]::Insert("lfcd.ps1")
    [Microsoft.Powershell.PSConsoleReadline]::AcceptLine()
}

Set-PSReadlineKeyHandler -Chord "Alt+f"  -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("lfcd ")
}

# lf-trsah (回收站)
function trash { lf 'C:\Users\ThinkPad\AppData\Local\lf\Trash' }

# ------------------- wezterm -------------------
# wezterm图片预览
function img { wezterm imgcat $args }

# ------------------- alacritty -------------------
# alacritty映射特性，有缺陷,vim的insert状态下输入快捷键会输出'F10,a'等
# 因此，最终映射ALT-h j k l 为左下上右
# Set-PSReadLineKeyHandler -Chord 'F10,a' -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Chord 'F10,b' -Function HistorySearchBackward


# ni 新建文本
# ren 重命名



