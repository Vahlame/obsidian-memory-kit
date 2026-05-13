# Operations and Day-2 Guide

## Rutina diaria recomendada

1. Trabaja normalmente en Cursor.
2. Guarda decisiones importantes en `PROJECTS/<proyecto>.md`.
3. Deja resumen corto en `SESSION_LOG.md`.
4. Deja que auto-sync empuje a GitHub.

## Comandos utiles

### Sync manual inmediato

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\sync-memory.ps1"
```

### Activar auto-sync

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\enable-auto-sync.ps1"
```

### Desactivar auto-sync

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\disable-auto-sync.ps1"
```

### Reactivar watchdog MCP

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Documents\cursor-memory-vault\cursor-install\enable-obsidian-mcp-watchdog.ps1"
```

## Multi-device

En nuevo equipo:

1. Instalar Git y Node.
2. Ejecutar `CursorMemory-Install.cmd`.
3. Reiniciar Cursor.
4. Pegar User Rule.

## Buenas practicas

- no guardar prompts completos salvo que aporten valor;
- evitar duplicados en `MEMORY.md`;
- mover conocimiento estable desde `SESSION_LOG.md` a `MEMORY.md`.
