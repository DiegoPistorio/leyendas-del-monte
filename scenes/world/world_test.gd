extends Node2D
## Mapa de prueba temporal para validar el movimiento en grilla y el D-pad táctil.
## H2 lo reemplaza por el mapa real del pueblo inicial.

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var player: Player = $Player
@onready var touch_dpad: TouchDpad = $TouchDpad


func _ready() -> void:
	touch_dpad.move_requested.connect(player.move_in_direction)
	player.set_camera_limits(tile_map_layer.get_used_rect())
