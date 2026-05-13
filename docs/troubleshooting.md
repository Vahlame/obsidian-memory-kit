# Troubleshooting

## MCP no disponible en Cursor

### Sintoma

Cursor dice que `obsidian-memory` no esta disponible.

### Diagnostico

1. Verifica `%USERPROFILE%\.cursor\mcp.json`.
2. Verifica health:

```powershell
Invoke-WebRequest -Uri "http://127.0.0.1:3001/health" -UseBasicParsing
```

3. Verifica watchdog:

```powershell
schtasks /Query /TN "CursorObsidianMcpWatchdog" /V /FO LIST
```

### Solucion

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\enable-obsidian-mcp-watchdog.ps1"
```

Reinicia Cursor.

## Ventana CMD aparece periodicamente

Usa tareas en modo oculto con `wscript //B //nologo` y `.vbs`.
No llames `powershell.exe` directo desde la tarea.

## Sync no sube cambios

1. Verifica remoto:

```powershell
git -C "$HOME\Documents\cursor-memory-vault" remote -v
```

2. Ejecuta sync manual:

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\sync-memory.ps1"
```

3. Si falla por auth, reautentica git/GitHub.

## Pull rebase conflict

Si dos equipos editaron la misma linea:

1. resuelve conflicto;
2. `git add .`;
3. `git rebase --continue`;
4. `git push`.
