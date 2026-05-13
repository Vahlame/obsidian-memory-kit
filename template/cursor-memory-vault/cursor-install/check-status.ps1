param(
    [int]$Port = 3001
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "== Cursor Memory Status ==" -ForegroundColor Cyan

try {
    $resp = Invoke-WebRequest -Uri "http://127.0.0.1:$Port/health" -UseBasicParsing -TimeoutSec 4
    Write-Host "MCP health: $($resp.StatusCode)"
} catch {
    Write-Host "MCP health: DOWN"
}

Write-Host ""
Write-Host "Task CursorMemoryAutoSync:"
schtasks /Query /TN "CursorMemoryAutoSync" /V /FO LIST

Write-Host ""
Write-Host "Task CursorObsidianMcpWatchdog:"
schtasks /Query /TN "CursorObsidianMcpWatchdog" /V /FO LIST
