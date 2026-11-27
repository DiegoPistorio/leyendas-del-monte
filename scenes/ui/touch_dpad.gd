class_name TouchDpad
extends CanvasLayer

signal move_requested(direction: Vector2i)


func _on_up_pressed() -> void:
	move_requested.emit(Vector2i.UP)


func _on_down_pressed() -> void:
	move_requested.emit(Vector2i.DOWN)


func _on_left_pressed() -> void:
	move_requested.emit(Vector2i.LEFT)


func _on_right_pressed() -> void:
	move_requested.emit(Vector2i.RIGHT)
