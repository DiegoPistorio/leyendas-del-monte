class_name Player
extends CharacterBody2D

@export var tile_size: int = 16
@export var move_duration: float = 0.15

@onready var camera: Camera2D = $Camera2D

var grid_position: Vector2i = Vector2i.ZERO:
	set(value):
		grid_position = value
		position = Vector2(value) * tile_size

var _is_moving: bool = false


func _ready() -> void:
	grid_position = Vector2i(position / tile_size)


func move_in_direction(direction: Vector2i) -> void:
	if _is_moving or direction == Vector2i.ZERO:
		return
	var motion: Vector2 = Vector2(direction) * tile_size
	if move_and_collide(motion, true):
		return
	_is_moving = true
	var target_grid: Vector2i = grid_position + direction
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", Vector2(target_grid) * tile_size, move_duration)
	await tween.finished
	grid_position = target_grid
	_is_moving = false


func set_camera_limits(used_rect: Rect2i) -> void:
	if used_rect.size == Vector2i.ZERO:
		return
	camera.limit_left = used_rect.position.x * tile_size
	camera.limit_top = used_rect.position.y * tile_size
	camera.limit_right = used_rect.end.x * tile_size
	camera.limit_bottom = used_rect.end.y * tile_size


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		move_in_direction(Vector2i.RIGHT)
	elif event.is_action_pressed("ui_left"):
		move_in_direction(Vector2i.LEFT)
	elif event.is_action_pressed("ui_up"):
		move_in_direction(Vector2i.UP)
	elif event.is_action_pressed("ui_down"):
		move_in_direction(Vector2i.DOWN)
