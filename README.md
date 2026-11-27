# Leyendas del Monte

RPG 2D para celular con estética de Game Boy Advance. Recorrés el Litoral argentino y,
con la ayuda de un payé (amuleto guaraní), sellás pactos con criaturas del folclore:
el Pombero, la Luz Mala, el Mboi Tu'i y muchas más.

> Obra original: toma el género de los RPG de criaturas, pero no usa nombres, criaturas,
> sprites ni marcas de otros juegos.

## Estado

En desarrollo. **Hito actual: H0 (preparación).**

| Hito | Contenido |
| --- | --- |
| H0 | Repo, proyecto Godot, export de prueba a Android |
| H1 | Movimiento en grilla, mapas con colisiones, cámara, D-pad táctil |
| H2 | NPCs y diálogos, transiciones entre mapas, encuentros (demo web) |
| H3 | Combate por turnos, tipos, experiencia, tests |
| H4 | Pactos con el payé, equipo, curación, menú y guardado |
| H5 | Jefe final, audio y pulido (release v0.1 con APK) |

El progreso de cada hito se cuenta en el [devlog](docs/devlog.md).

## Stack

- [Godot 4.7.2](https://godotengine.org/) con GDScript tipado
- Resolución base 240x160 (como la GBA), escalada en múltiplos enteros
- Plataformas: Android primero, después web
- Tests con [GUT](https://github.com/bitwes/Gut)

## Cómo abrir el proyecto

1. Instalá Godot 4.7.2 (versión estándar, no hace falta la de .NET).
2. Cloná el repo:
   ```bash
   git clone https://github.com/DiegoPistorio/leyendas-del-monte.git
   ```
3. En el gestor de proyectos de Godot: **Importar** y elegí `project.godot`.

## Estructura

```
assets/    sprites, tilesets y audio
data/      criaturas, ataques y tipos (.tres) y sus clases Resource
scenes/    escenas del mundo, del combate y de la interfaz
scripts/   autoloads y lógica compartida
docs/      diseño del juego, devlog y capturas
tests/     pruebas con GUT
```

## Licencia

El código está bajo licencia [MIT](LICENSE). Los assets de terceros tienen su propia
licencia, detallada en [CREDITS.md](CREDITS.md).
