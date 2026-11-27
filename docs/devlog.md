# Devlog

Registro del desarrollo de Leyendas del Monte, hito por hito.

## H0 — Preparación (en curso)

### 2026-11-26 — Estructura inicial del proyecto (PR #1)

- Proyecto Godot 4.7.2 creado con resolución base 240x160, stretch `viewport`
  con escala entera y filtro de texturas `Nearest` para pixel art nítido.
  La ventana de escritorio abre en 960x640 (4x).
- Renderer Compatibility para apuntar a Android y web con el mismo proyecto.
- Emulación de toque con el mouse, para probar el D-pad táctil desde el editor.
- Estructura de carpetas según `CLAUDE.md`, `.gitignore` (ignora `.godot/`,
  keystores, claves y builds), `.gitattributes` con fin de línea LF, README y CREDITS.
- Se versiona el subagente `godot-reviewer` (`.claude/agents/`), que revisa
  GDScript y escenas antes de cada PR. Revisó este cambio sin encontrar bloqueantes;
  a partir de su revisión se ampliaron los patrones de secretos del `.gitignore`.
- Copyright de `LICENSE` con el nombre completo.

**Pendiente para cerrar H0:** export de prueba a Android (Android SDK, keystore
de debug y `export_presets.cfg`).
