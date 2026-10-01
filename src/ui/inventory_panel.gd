class_name InventoryPanel
extends PanelContainer

@onready var _items_label: Label = $Margin/Column/Items

var _inventory: Inventory
var _item_names: Dictionary = {}

func bind(inventory: Inventory, definitions: Array[ItemDefinition]) -> void:
	_inventory = inventory
	for definition in definitions:
		if definition != null:
			_item_names[definition.id] = definition.display_name
	_inventory.changed.connect(_on_inventory_changed)
	_render(_inventory.snapshot())

func _on_inventory_changed(snapshot: Dictionary) -> void:
	_render(snapshot)

func _render(snapshot: Dictionary) -> void:
	if snapshot.is_empty():
		_items_label.text = "Vacio"
		return
	var lines: PackedStringArray = []
	for item_id in snapshot:
		var display_name: String = str(_item_names.get(item_id, item_id))
		lines.append("%s x%d" % [display_name, int(snapshot[item_id])])
	_items_label.text = "\n".join(lines)
