# Devlog

Registro del desarrollo de Leyendas del Monte, hito por hito.

## H0 — Preparación (cerrado)

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

### 2026-11-27 — Export de prueba a Android (cierre de H0)

- Instalados JDK 17 (Temurin), Android SDK (Android Studio, platform-tools +
  build-tools + plataforma API 34) y los export templates de Godot 4.7.2
  (escritorio + Android), con `ANDROID_HOME`/`JAVA_HOME` configurados y
  apuntados también desde Editor Settings de Godot.
- Keystore de debug: se usa el que trae Godot incorporado (no se generó
  ninguno manual); no hace falta versionar nada, el `.gitignore` ya cubre
  `*.keystore`/`*.jks` como red de seguridad igual.
- Preset de export Android (`export_presets.cfg`) con package
  `com.leyendasdelmonte.app`, arquitectura `arm64-v8a` únicamente, Gradle
  Build desactivado, y orientación `landscape` seteada a nivel de proyecto
  para que coincida con la resolución base 240x160.
- Activada la compresión de texturas ETC2/ASTC en Ajustes del Proyecto,
  requerida para exportar a plataformas móviles.
- Escena placeholder `scenes/world/test_export.tscn` (+ `test_export.gd`)
  como `run/main_scene` temporal: fondo de color y texto que cambia de
  color al tocar la pantalla, solo para validar el pipeline de export y
  el input táctil en un dispositivo real. Es descartable: la reemplaza la
  escena real de mundo en el primer PR de H1.
- Export de debug instalado con `adb install` en un celular físico:
  abre en horizontal, se ve el fondo y el texto, y el toque en pantalla
  cambia el color del fondo — confirma el pipeline de export y el input
  táctil funcionando en dispositivo real. Cierra H0.

## H1 — Mundo (en curso)
