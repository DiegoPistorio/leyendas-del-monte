# Leyendas del Monte

RPG 2D para celular con estética de Game Boy Advance, donde el jugador sella pactos
con criaturas del folclore argentino. Obra original: toma el género de Pokémon, pero
nunca sus nombres, criaturas, sprites ni marcas.

Repo público en GitHub. Es portfolio: el código, los commits y la documentación
tienen que verse profesionales.

## Stack

- Motor: Godot 4.x con GDScript, con tipado estático siempre (`var hp: int = 10`).
- Plataformas: Android primero, después build web (itch.io / GitHub Pages).
- Resolución base: 240x160, escalada con stretch mode `viewport`. Tiles de 16x16.
- Mapas: `TileMapLayer` (no usar el nodo `TileMap` viejo, está deprecado).
- Datos: criaturas, ataques y tipos como `Resource` (.tres) en `data/`.
- Tests: GUT, en `tests/`.

## Estructura

```
assets/    sprites, tilesets, audio (con su licencia en CREDITS.md)
data/      criaturas, ataques, tipos (.tres) y sus clases Resource
scenes/    world/, battle/, ui/
scripts/   autoloads y lógica compartida
docs/      diseño del juego, devlog, capturas
tests/     pruebas con GUT
```

## Convenciones

- Archivos y carpetas en `snake_case`; clases con `class_name` en `PascalCase`.
- Código e identificadores en inglés; textos del juego y docs en español.
- Una escena = un script con el mismo nombre (`player.tscn` + `player.gd`).
- Comunicación entre nodos por señales; nada de rutas absolutas a nodos (`get_node("/root/...")`).
- Commits con Conventional Commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`.
- Una rama por funcionalidad (`feat/grid-movement`) y PR hacia `main`.
- Nunca commitear keystores, claves ni archivos de `.godot/`.

## Diseño (resumen)

- Mecánica central: el payé (amuleto guaraní). No se "atrapan" criaturas, se sellan pactos.
- Tipos: Monte > Tierra > Agua > Fuego > Monte. Noche le gana a todos (daño leve extra)
  y pierde contra Fuego.
- Criaturas del MVP (Litoral): Pombero, Mboi Tu'i, Luz Mala (iniciales); Yasy Yateré,
  Kurupí, Ao Ao, Moñái (salvajes); Teju Jaguá (jefe).
- Mapa del MVP: pueblo inicial -> ruta del monte -> orilla del río -> cueva del jefe.
- Las figuras sagradas (Pachamama) aparecen en la historia, nunca como criaturas de combate.

## Roadmap

- [ ] H0 Preparación: repo, proyecto Godot, export de prueba a Android
- [ ] H1 Mundo: movimiento en grilla, TileMapLayer con colisiones, cámara, D-pad táctil
- [ ] H2 Pueblo vivo: NPCs y diálogos, transiciones entre mapas, encuentros (-> demo web)
- [ ] H3 Combate: datos, combate por turnos, tipos, experiencia, tests GUT
- [ ] H4 Pactos: payé, equipo, curación en el rancho, menú y guardado
- [ ] H5 Cierre: jefe, audio, pulido (-> release v0.1 con APK)

**Hito actual: H0**

## Cómo trabajar en este repo

- Antes de una funcionalidad nueva, proponé el plan (escenas, scripts, señales) y esperá el OK.
- Cambios chicos y verificables; al terminar, decime cómo probarlo en el editor.
- No puedo ver el juego corriendo: si algo visual depende de valores (posiciones, tamaños),
  explicame qué revisar en el editor.
- Al cerrar un hito: actualizar este roadmap y agregar una entrada en `docs/devlog.md`.
