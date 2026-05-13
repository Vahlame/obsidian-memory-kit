# How Cursor MCP Works Here

## Objetivo

Entender exactamente que pasa cuando Cursor "consulta memoria".

## Cadena de ejecucion

1. Cursor detecta `obsidian-memory` en `%USERPROFILE%\.cursor\mcp.json`.
2. Lanza comando local:
   - `npx -y mcp-remote http://127.0.0.1:3001/sse`
3. `mcp-remote` crea un puente local entre STDIO (Cursor) y SSE (servidor remoto/local).
4. El servidor Obsidian MCP procesa tools de lectura/escritura del vault.
5. El resultado vuelve a Cursor y se incorpora al contexto.

## Por que usar mcp-remote

- desacopla Cursor del transporte del servidor MCP;
- evita incompatibilidades de clientes que esperan STDIO;
- permite que el servidor real viva como proceso separado y supervisado.

## Donde se puede romper

- `mcp.json` invalido o viejo;
- servidor MCP abajo en `:3001`;
- node/npm no disponible;
- bloqueos de red local/firewall;
- tareas scheduler deshabilitadas.

## Como lo robustecemos

- task `CursorObsidianMcpWatchdog` cada 5 min;
- health-check por HTTP `/health`;
- relanzamiento automatico si no responde.
