#!/usr/bin/env pwsh
(Get-Host).UI.RawUI.WindowTitle = "PowerShell " + (Get-Location)

# "PS " + $(Get-Location) + "+"

function prompt () {	
	$currentDir = (Convert-Path .)
	$showDir = $currentDir.Replace($env:HOME , "~")
	Write-Host "PS " -NoNewLine -ForegroundColor Gray -BackgroundColor DarkGray
	Write-Host " " -NoNewLine -ForegroundColor DarkGray -BackgroundColor Black
	Write-Host (whoami) -NoNewLine -ForegroundColor Blue -BackgroundColor Black
	Write-Host "@" -NoNewLine -ForegroundColor Blue -BackgroundColor Black
	Write-Host (hostname) -NoNewLine -ForegroundColor Blue -BackgroundColor Black
	Write-Host " " -NoNewLine -ForegroundColor Black -BackgroundColor DarkBlue
	Write-Host $showDir -NoNewLine -ForegroundColor Black -BackgroundColor DarkBlue
	Write-Host " " -NoNewLine -ForegroundColor Black -BackgroundColor DarkBlue
	Write-Host " " -NoNewLine -ForegroundColor DarkBlue
}
