Siempre que este disponible el servidor MCP `obsidian-memory`, sigue este flujo:

1. Al iniciar tarea:
   - leer `MEMORY.md`
   - detectar proyecto actual
   - usar o crear `PROJECTS/<proyecto>.md`

2. Durante tarea:
   - registrar decisiones de proyecto
   - checkpoint cada 3-5 mensajes si hubo avance real
   - no guardar secretos

3. Al cerrar tarea:
   - append breve en `SESSION_LOG.md`
   - mover a `MEMORY.md` solo lo durable/global

4. Calidad:
   - no escribir por escribir
   - evitar duplicados
   - separar hechos de hipotesis
