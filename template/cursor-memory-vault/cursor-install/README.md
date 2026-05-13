# cursor-install scripts

## Install / bootstrap

- `install-cursor-memory.ps1`: configura vault base y `mcp.json`.
- `bootstrap-from-github.ps1`: clona/actualiza repo y activa automatizaciones.
- `init-github-repo.ps1`: inicializa y publica vault en GitHub.

## Runtime operations

- `sync-memory.ps1`: commit/pull/push del vault.
- `enable-auto-sync.ps1`: crea task de sync cada X minutos.
- `disable-auto-sync.ps1`: elimina task de auto-sync.

## MCP reliability

- `ensure-obsidian-mcp.ps1`: verifica/levanta servidor MCP en `:3001`.
- `enable-obsidian-mcp-watchdog.ps1`: crea watchdog cada 5 min.
