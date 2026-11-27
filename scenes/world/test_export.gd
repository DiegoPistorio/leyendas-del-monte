extends Control
## Placeholder temporal de H0 para validar el export a Android.
## Lo reemplaza la escena real de mundo en el primer PR de H1.

@onready var background: ColorRect = $Background

var colors: Array[Color] = [Color.DARK_GREEN, Color.SADDLE_BROWN, Color.STEEL_BLUE]
var color_index: int = 0


func _unhandled_input(event: InputEvent) -> void:
	var is_tap: bool = event is InputEventScreenTouch and event.pressed
	var is_click: bool = event is InputEventMouseButton and event.pressed
	if is_tap or is_click:
		color_index = (color_index + 1) % colors.size()
		background.color = colors[color_index]
