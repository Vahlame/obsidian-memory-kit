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

if (-not (Test-Path -LiteralPath (Join-Path $VaultPath ".git"))) {
    git -C $VaultPath init
}

$hasOrigin = (git -C $VaultPath remote) -contains "origin"
if (-not $hasOrigin) {
    git -C $VaultPath remote add origin $RepoUrl
} else {
    git -C $VaultPath remote set-url origin $RepoUrl
}

git -C $VaultPath add .
git -C $VaultPath commit -m "bootstrap cursor memory vault" 2>$null | Out-Null
git -C $VaultPath branch -M $Branch
git -C $VaultPath push -u origin $Branch

Write-Host "Repo inicializado y publicado."
