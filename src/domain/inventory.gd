class_name Inventory
extends RefCounted

signal changed(snapshot: Dictionary)

var _items: Dictionary = {}

func add(item_id: String, quantity: int) -> bool:
	if item_id.is_empty() or quantity <= 0:
		return false
	_items[item_id] = int(_items.get(item_id, 0)) + quantity
	changed.emit(snapshot())
	return true

func remove(item_id: String, quantity: int) -> bool:
	if item_id.is_empty() or quantity <= 0:
		return false
	var current: int = count(item_id)
	if current < quantity:
		return false
	var remaining: int = current - quantity
	if remaining == 0:
		_items.erase(item_id)
	else:
		_items[item_id] = remaining
	changed.emit(snapshot())
	return true

func count(item_id: String) -> int:
	return int(_items.get(item_id, 0))

func has(item_id: String) -> bool:
	return count(item_id) > 0

func snapshot() -> Dictionary:
	return _items.duplicate()
