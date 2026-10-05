class_name Interactable
extends Node2D

signal item_collected(item: ItemDefinition)

@export var item_definition: ItemDefinition
@export var interaction_radius: float = 80.0

var _available := true

# Dibuja el area de interaccion para que el jugador vea donde pararse
func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	if _available:
		draw_arc(Vector2.ZERO, interaction_radius, 0.0, TAU, 48, Color(1, 1, 1, 0.25), 2.0)

func try_interact(origin: Vector2, inventory: Inventory) -> bool:
	if not _available or item_definition == null:
		return false
	if origin.distance_to(global_position) > interaction_radius:
		return false
	if not inventory.add(item_definition.id, 1):
		return false
	_available = false
	visible = false
	queue_redraw()
	item_collected.emit(item_definition)
	return true
