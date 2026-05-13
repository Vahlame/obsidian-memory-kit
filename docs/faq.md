# FAQ

## Esto es "memoria infinita" real?

No. Es memoria externa persistentemente almacenada y recuperada bajo demanda.

## Necesito Obsidian abierto todo el tiempo?

No para el storage. El servidor MCP trabaja sobre el vault en disco.

## Puedo usar varios proyectos a la vez?

Si. Usa `PROJECTS/<proyecto>.md` por cada proyecto y conserva `MEMORY.md` para reglas globales.

## Se puede automatizar todo?

Casi todo:

- sync automatico cada 10 min;
- watchdog MCP cada 5 min;
- lectura/escritura guiada por User Rules.

La unica parte manual obligatoria es pegar User Rules en Cursor por dispositivo.

## Funciona en Linux/Mac?

La arquitectura si.  
Los scripts de este repo son Windows-first (PowerShell + schtasks).  
Puedes portar a `cron`/`launchd` facilmente.

## Que hago si Cursor no ve el MCP?

1. Ejecuta `scripts/doctor.ps1`.
2. Revisa `mcp.json`.
3. Revisa `/health`.
4. Reinicia Cursor.
