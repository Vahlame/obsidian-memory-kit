# Cursor + Obsidian Memory System (Full Guide)

Guia completa para construir memoria de largo plazo en Cursor con Obsidian, GitHub y automatizacion local.

## Resultado final

Con este setup consigues:

- memoria persistente entre sesiones y dispositivos;
- separacion de memoria global y memoria por proyecto;
- sincronizacion automatica a GitHub;
- recuperacion automatica del servidor MCP si se cae;
- instalacion repetible en equipos nuevos.

## Por que esto funciona

Los modelos no guardan "memoria infinita" dentro del contexto interno.  
Este sistema externaliza la memoria en archivos Markdown versionados:

- `MEMORY.md`: conocimiento global y estable;
- `SESSION_LOG.md`: historial de trabajo;
- `PROJECTS/<proyecto>.md`: decisiones y contexto por proyecto.

Cursor consume esa memoria via MCP, y Git la vuelve durable/cross-device.

## Como funciona Cursor en este setup

1. Cursor lee `%USERPROFILE%\.cursor\mcp.json`.
2. Se registra el servidor `obsidian-memory`.
3. Cursor usa `mcp-remote` para conectarse a `http://127.0.0.1:3001/sse`.
4. Un servidor local Obsidian MCP atiende lectura/escritura del vault.
5. Task Scheduler mantiene:
   - auto-sync git cada 10 min (`CursorMemoryAutoSync`);
   - watchdog MCP cada 5 min (`CursorObsidianMcpWatchdog`).

## Estructura del repo de guia

- `README.md`: overview de arquitectura y flujo.
- `docs/`: instalacion, operacion y troubleshooting detallado.
- `template/cursor-memory-vault/`: vault completo listo para usar.
- `examples/CURSOR_USER_RULE_MEMORY.md`: regla recomendada para User Rules.
- `scripts/health-check.ps1`: check rapido de salud MCP.

## Metodos de instalacion

### Metodo A - Rapido (recomendado)

1. Crea repo privado para tu vault.
2. Copia el contenido de `template/cursor-memory-vault/` a ese repo.
3. Ejecuta `CursorMemory-Install.cmd` (dentro del template) en cada equipo.
4. Reinicia Cursor.
5. Pega la regla de `examples/CURSOR_USER_RULE_MEMORY.md` en User Rules.

### Metodo B - Manual controlado

Sigue `docs/install-manual.md` si quieres revisar cada paso y editar todo a mano.

### Metodo C - Operacion avanzada multi-equipo

Sigue `docs/operations.md` para mantenimiento, recovery, y buenas practicas de equipo.

## Configuracion MCP esperada

Archivo: `%USERPROFILE%\.cursor\mcp.json`

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

## Verificacion completa

### 1) MCP local

```powershell
powershell -ExecutionPolicy Bypass -File ".\scripts\health-check.ps1"
```

Debe mostrar `StatusCode: 200`.

### 2) Cursor puede leer y escribir

En chat de Cursor:

1. "Usa `obsidian-memory` y lee `MEMORY.md`."
2. "Agrega una linea en `SESSION_LOG.md` con texto `test mcp ok`."

### 3) Scheduler activo

```powershell
schtasks /Query /TN "CursorMemoryAutoSync" /V /FO LIST
schtasks /Query /TN "CursorObsidianMcpWatchdog" /V /FO LIST
```

`Ultimo resultado` debe ser `0` con ejecuciones recientes.

## Archivos clave para usar ya

- Vault template: `template/cursor-memory-vault/`
- Instalador one-click: `template/cursor-memory-vault/CursorMemory-Install.cmd`
- Scripts de instalacion: `template/cursor-memory-vault/cursor-install/`
- Regla de memoria: `examples/CURSOR_USER_RULE_MEMORY.md`

## Seguridad

- Usa repo privado para memoria real.
- No guardes secretos en Markdown.
- Si expones un token, revocalo inmediatamente.

## Documentacion adicional

- `docs/architecture.md`
- `docs/install-quickstart.md`
- `docs/install-manual.md`
- `docs/operations.md`
- `docs/troubleshooting.md`

## Licencia

MIT
