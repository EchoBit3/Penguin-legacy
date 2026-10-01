extends Node2D

@onready var _player: PlayerActor = $Player
@onready var _collectible: Interactable = $Collectible
@onready var _inventory_panel: InventoryPanel = $Interface/InventoryPanel
@onready var _status_label: Label = $Interface/Status

var inventory := Inventory.new()

func _ready() -> void:
	_player.interaction_requested.connect(_on_interaction_requested)
	_collectible.item_collected.connect(_on_item_collected)
	_inventory_panel.bind(inventory, [_collectible.item_definition])
	_status_label.text = "Acercate al objeto y presiona Enter"

func _on_interaction_requested(origin: Vector2) -> void:
	if _collectible.try_interact(origin, inventory):
		return
	_status_label.text = "No hay nada para recoger aqui"

func _on_item_collected(item: ItemDefinition) -> void:
	_status_label.text = "Obtuviste: %s" % item.display_name
