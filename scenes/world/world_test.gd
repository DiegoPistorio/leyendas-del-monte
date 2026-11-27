extends Node2D
## Mapa de prueba temporal para validar el movimiento en grilla y el D-pad táctil.
## H2 lo reemplaza por el mapa real del pueblo inicial.

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var player: Player = $Player
@onready var touch_dpad: TouchDpad = $TouchDpad


func _ready() -> void:
	touch_dpad.move_requested.connect(player.move_in_direction)
	player.set_camera_limits(tile_map_layer.get_used_rect())
	_generate_placeholder_tileset_textures()


## TODO(temporal): borrar esta función una vez creado el TileSet a mano en el editor.
## Genera dos texturas de 16x16 (pasto caminable / piedra que bloquea), una por
## tile, para no depender de dibujar un PNG a mano en un editor de imágenes externo.
func _generate_placeholder_tileset_textures() -> void:
	_generate_tile_texture("res://assets/tilesets/tile_grass.png", Color(0.3, 0.55, 0.25))
	_generate_tile_texture("res://assets/tilesets/tile_rock.png", Color(0.45, 0.42, 0.4))


func _generate_tile_texture(path: String, color: Color) -> void:
	if FileAccess.file_exists(path):
		return
	var image: Image = Image.create(16, 16, false, Image.FORMAT_RGBA8)
	image.fill(color)
	DirAccess.make_dir_recursive_absolute("res://assets/tilesets")
	image.save_png(path)
	print("Placeholder tile generado en ", path)
