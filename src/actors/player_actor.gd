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

# Convierte input en velocidad y mantiene al avatar dentro de la sala
func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * move_speed
	move_and_slide()
	clamp_to_room()
	_update_skin(direction)
	if Input.is_action_just_pressed("ui_accept"):
		interaction_requested.emit(global_position)

# Anima la skin fan-made segun el movimiento; sin skin no hace nada
func _update_skin(direction: Vector2) -> void:
	var skin := get_node_or_null("Skin")
	if skin == null:
		return
	if direction.x < 0.0:
		skin.scale.x = -absf(skin.scale.x)
	elif direction.x > 0.0:
		skin.scale.x = absf(skin.scale.x)
	for layer in [skin.get_node("LayerTop"), skin.get_node("LayerMid"), skin.get_node("LayerLow")]:
		if direction != Vector2.ZERO:
			layer.play("walk")
		else:
			layer.play("idle")

func clamp_to_room() -> void:
	if room_bounds.size != Vector2.ZERO:
		global_position.x = clamp(global_position.x, room_bounds.position.x, room_bounds.end.x)
		global_position.y = clamp(global_position.y, room_bounds.position.y, room_bounds.end.y)

# Dibuja el placeholder solo cuando no hay skin fan-made cargada
func _draw() -> void:
	if get_node_or_null("Skin") != null:
		return
	draw_circle(Vector2.ZERO, BODY_RADIUS, body_color)
	draw_circle(Vector2(-EYE_OFFSET, -5.0), EYE_RADIUS, Color.WHITE)
	draw_circle(Vector2(EYE_OFFSET, -5.0), EYE_RADIUS, Color.WHITE)
	draw_circle(Vector2(-EYE_OFFSET, -5.0), EYE_RADIUS * 0.5, Color(0.05, 0.09, 0.16, 1))
	draw_circle(Vector2(EYE_OFFSET, -5.0), EYE_RADIUS * 0.5, Color(0.05, 0.09, 0.16, 1))
	draw_colored_polygon(PackedVector2Array([Vector2(-7, 2), Vector2(7, 2), Vector2(0, 11)]), Color(1, 0.65, 0.12, 1))
