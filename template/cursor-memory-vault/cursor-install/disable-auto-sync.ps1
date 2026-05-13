param(
    [string]$TaskName = "CursorMemoryAutoSync"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

schtasks /Delete /TN $TaskName /F | Out-Null
Write-Host "Auto-sync desactivado: $TaskName"
