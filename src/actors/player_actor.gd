class_name PlayerActor
extends CharacterBody2D

signal interaction_requested(origin: Vector2)

@export var move_speed: float = 180.0
@export var body_color: Color = Color(0.2, 0.55, 0.9, 1)
@export var room_bounds: Rect2

const BODY_RADIUS := 24.0
const EYE_RADIUS := 4.0
const EYE_OFFSET := 9.0

func _ready() -> void:
	queue_redraw()

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * move_speed
	move_and_slide()
	clamp_to_room()
	if Input.is_action_just_pressed("ui_accept"):
		interaction_requested.emit(global_position)

func clamp_to_room() -> void:
	if room_bounds.size != Vector2.ZERO:
		global_position.x = clamp(global_position.x, room_bounds.position.x, room_bounds.end.x)
		global_position.y = clamp(global_position.y, room_bounds.position.y, room_bounds.end.y)

func _draw() -> void:
	draw_circle(Vector2.ZERO, BODY_RADIUS, body_color)
	draw_circle(Vector2(-EYE_OFFSET, -5.0), EYE_RADIUS, Color.WHITE)
	draw_circle(Vector2(EYE_OFFSET, -5.0), EYE_RADIUS, Color.WHITE)
	draw_circle(Vector2(-EYE_OFFSET, -5.0), EYE_RADIUS * 0.5, Color(0.05, 0.09, 0.16, 1))
	draw_circle(Vector2(EYE_OFFSET, -5.0), EYE_RADIUS * 0.5, Color(0.05, 0.09, 0.16, 1))
	draw_colored_polygon(PackedVector2Array([Vector2(-7, 2), Vector2(7, 2), Vector2(0, 11)]), Color(1, 0.65, 0.12, 1))
