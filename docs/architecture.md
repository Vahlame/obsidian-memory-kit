# Architecture Deep Dive

## Objetivo

Dar memoria persistente y portable a Cursor sin depender de contexto temporal del modelo.

## Componentes

- `Cursor`: cliente principal.
- `mcp-remote`: puente STDIO -> SSE.
- `@smith-and-web/obsidian-mcp-server`: servidor de memoria.
- `Obsidian Vault`: almacenamiento en Markdown.
- `GitHub repo`: sincronizacion cross-device.
- `Task Scheduler`: automatizacion local.

## Flujo de datos

1. El agente pide leer/escribir memoria.
2. Cursor invoca `obsidian-memory` definido en `mcp.json`.
3. `mcp-remote` conecta a `http://127.0.0.1:3001/sse`.
4. El servidor MCP opera archivos del vault.
5. Auto-sync hace `git add/commit/pull/push`.

## Dise�o de memoria

- Global: `MEMORY.md` (preferencias, reglas transversales).
- Proyecto: `PROJECTS/<proyecto>.md` (contexto tecnico por repo).
- Cronologico: `SESSION_LOG.md` (eventos y decisiones por fecha).

## Automatizaciones

- `CursorMemoryAutoSync` (cada 10 minutos):
  - ejecuta `sync-memory.ps1` en oculto;
  - empuja cambios recientes a GitHub.

- `CursorObsidianMcpWatchdog` (cada 5 minutos):
  - verifica `/health`;
  - si no responde, relanza servidor MCP.

## Trade-offs

- Pro:
  - simple de inspeccionar;
  - portable;
  - auditable en git.

- Contra:
  - depende de tareas locales;
  - requiere disciplina para no guardar ruido.
