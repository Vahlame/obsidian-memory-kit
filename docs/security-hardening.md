# Security Hardening

## Riesgo principal

Tu vault puede contener contexto sensible de proyectos.  
Tratalo como un repositorio de conocimiento de trabajo.

## Reglas base

- usa repos privados para memoria real;
- nunca guardes API keys, tokens, passwords, secretos;
- evita pegar dumps completos de logs con secretos;
- separa memoria tecnica de datos personales.

## GitHub

- habilita 2FA;
- usa PATs temporales cuando sea posible;
- revoca tokens expuestos inmediatamente;
- limita scopes al minimo necesario.

## Obsidian MCP

- usa `127.0.0.1` para conexiones locales;
- no expongas el endpoint SSE a internet sin auth;
- si publicas endpoint remoto, usa HTTPS + API key + red segura.

## Operacion segura

- revisa diffs antes de push;
- usa `git status` frecuentemente;
- audita historial de `SESSION_LOG.md` periodicamente.

## Checklist mensual

- [ ] revisar tareas scheduler activas;
- [ ] rotar credenciales antiguas;
- [ ] limpiar entradas obsoletas;
- [ ] validar que no haya secretos en git history.
