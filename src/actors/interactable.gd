class_name Interactable
extends Node2D

signal item_collected(item: ItemDefinition)

@export var item_definition: ItemDefinition
@export var interaction_radius: float = 80.0

var _available := true

func try_interact(origin: Vector2, inventory: Inventory) -> bool:
	if not _available or item_definition == null:
		return false
	if origin.distance_to(global_position) > interaction_radius:
		return false
	if not inventory.add(item_definition.id, 1):
		return false
	_available = false
	visible = false
	item_collected.emit(item_definition)
	return true
