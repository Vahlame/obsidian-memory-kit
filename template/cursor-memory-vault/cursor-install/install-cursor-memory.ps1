param(
    [string]$VaultPath = "$HOME\Documents\cursor-memory-vault",
    [string]$CursorMcpPath = "$HOME\.cursor\mcp.json",
    [int]$Port = 3001
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Ensure-TextFile {
    param(
        [string]$Path,
        [string]$Content
    )
    if (-not (Test-Path -LiteralPath $Path)) {
        $parent = Split-Path -Path $Path -Parent
        Ensure-Directory -Path $parent
        Set-Content -Path $Path -Value $Content -Encoding UTF8
    }
}

Ensure-Directory -Path $VaultPath
Ensure-Directory -Path (Split-Path -Path $CursorMcpPath -Parent)
Ensure-Directory -Path (Join-Path $VaultPath "PROJECTS")
Ensure-Directory -Path (Join-Path $VaultPath "SNIPPETS")
Ensure-Directory -Path (Join-Path $VaultPath "cursor-install")

Ensure-TextFile -Path (Join-Path $VaultPath "README.md") -Content "# Cursor Memory Vault"
Ensure-TextFile -Path (Join-Path $VaultPath "MEMORY.md") -Content "# MEMORY"
Ensure-TextFile -Path (Join-Path $VaultPath "SESSION_LOG.md") -Content "# SESSION LOG"

$config = [pscustomobject]@{
    mcpServers = [pscustomobject]@{
        "obsidian-memory" = [pscustomobject]@{
            command = "npx"
            args = @("-y", "mcp-remote", "http://127.0.0.1:$Port/sse")
        }
    }
}

$json = $config | ConvertTo-Json -Depth 20
Set-Content -Path $CursorMcpPath -Value $json -Encoding UTF8

Write-Host "Instalacion base completada."
Write-Host "Vault: $VaultPath"
Write-Host "MCP: $CursorMcpPath"
