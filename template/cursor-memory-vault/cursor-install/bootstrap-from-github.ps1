param(
    [Parameter(Mandatory = $true)]
    [string]$RepoUrl,
    [string]$VaultPath = "$HOME\Documents\cursor-memory-vault",
    [string]$Branch = "main"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git no esta instalado o no esta en PATH."
}

if (-not (Test-Path -LiteralPath $VaultPath)) {
    git clone $RepoUrl $VaultPath
} else {
    if (-not (Test-Path -LiteralPath (Join-Path $VaultPath ".git"))) {
        throw "La ruta '$VaultPath' existe pero no es un repositorio Git."
    }
    git -C $VaultPath fetch origin
    git -C $VaultPath checkout $Branch
    git -C $VaultPath pull --rebase origin $Branch
}

$installer = Join-Path $VaultPath "cursor-install\install-cursor-memory.ps1"
if (-not (Test-Path -LiteralPath $installer)) {
    throw "No se encontro instalador: $installer"
}

powershell -ExecutionPolicy Bypass -File $installer -VaultPath $VaultPath

$autoSync = Join-Path $VaultPath "cursor-install\enable-auto-sync.ps1"
if (Test-Path -LiteralPath $autoSync) {
    powershell -ExecutionPolicy Bypass -File $autoSync -VaultPath $VaultPath -EveryMinutes 10
}

$watchdog = Join-Path $VaultPath "cursor-install\enable-obsidian-mcp-watchdog.ps1"
if (Test-Path -LiteralPath $watchdog) {
    powershell -ExecutionPolicy Bypass -File $watchdog -VaultPath $VaultPath -Port 3001
}

Write-Host "Bootstrap completo. Reinicia Cursor."
