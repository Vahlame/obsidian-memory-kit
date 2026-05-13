# Manual Install (Paso a paso)

Usa este modo si quieres entender y controlar cada parte.

## 1) Estructura del vault

Crea:

```text
%USERPROFILE%\Documents\cursor-memory-vault\
  MEMORY.md
  SESSION_LOG.md
  PROJECTS\
  SNIPPETS\
  cursor-install\
```

## 2) Configura MCP en Cursor

Edita `%USERPROFILE%\.cursor\mcp.json`:

```json
{
  "mcpServers": {
    "obsidian-memory": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote",
        "http://127.0.0.1:3001/sse"
      ]
    }
  }
}
```

## 3) Inicia servidor MCP

```powershell
$env:VAULT_PATH="$HOME\Documents\cursor-memory-vault"
$env:PORT="3001"
npx -y @smith-and-web/obsidian-mcp-server
```

## 4) Scheduler (opcional pero recomendado)

Desde `cursor-install`:

```powershell
powershell -ExecutionPolicy Bypass -File ".\enable-auto-sync.ps1"
powershell -ExecutionPolicy Bypass -File ".\enable-obsidian-mcp-watchdog.ps1"
```

## 5) Verifica salud

```powershell
Invoke-WebRequest -Uri "http://127.0.0.1:3001/health" -UseBasicParsing
```

## 6) Reinicia Cursor

Reiniciar para cargar el MCP actualizado.
