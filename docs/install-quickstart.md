# Quickstart (15 minutos)

## 0) Requisitos

- Git instalado.
- Node.js + npm instalado.
- Cursor instalado.

## 1) Crea tu repo privado de memoria

Ejemplo: `https://github.com/<tu-usuario>/cursor-memory-vault.git`

## 2) Copia el template a tu repo

Usa todo el contenido de:

- `template/cursor-memory-vault/`

## 3) Ejecuta instalador one-click

En tu equipo:

- abre `CursorMemory-Install.cmd`
- pega la URL de tu repo privado
- espera a que termine

## 4) Reinicia Cursor

Cerrar y abrir Cursor para recargar `mcp.json`.

## 5) Pega User Rule

Copia:

- `examples/CURSOR_USER_RULE_MEMORY.md`

En:

- Cursor Settings -> Rules -> User Rules

## 6) Verifica

En chat:

1. "Usa `obsidian-memory` y lee `MEMORY.md`."
2. "Agrega linea de prueba en `SESSION_LOG.md`."

En PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File ".\scripts\health-check.ps1"
```
