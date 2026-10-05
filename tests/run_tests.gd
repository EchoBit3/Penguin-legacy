extends SceneTree

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	var results: Array[String] = []
	for result in InventoryTests.run():
		if result.begins_with("FAIL -"):
			push_error(result)
			quit(1)
			return
		results.append(result)

	var item := load("res://src/data/items/blue_shell.tres") as ItemDefinition
	if not _check(item != null, "item definition loads"):
		return
	var scene := load("res://src/scenes/main.tscn") as PackedScene
	if not _check(scene != null, "main scene resource loads"):
		return
	var instance := scene.instantiate()
	root.add_child(instance)
	var player: PlayerActor = instance.get_node("Player")
	var interactable: Interactable = instance.get_node("Collectible")
	if not _check(player != null, "player actor exists"):
		return
	if not _check(interactable != null, "interactable exists"):
		return

	player.global_position = Vector2.ZERO
	player.clamp_to_room()
	if not _check(player.global_position == Vector2(56, 120), "player stays inside room bounds"):
		return
	if not _check(player.move_speed > 0.0, "player has positive move speed"):
		return
	Input.action_press("ui_right")
	player._physics_process(0.016)
	Input.action_release("ui_right")
	if not _check(player.velocity.x > 0.0, "player responds left and right"):
		return

	player.global_position = interactable.global_position + Vector2(interactable.interaction_radius + 20.0, 0)
	instance.call("_on_interaction_requested", player.global_position)
	if not _check(not instance.inventory.has(item.id), "interaction respects distance"):
		return

	player.global_position = interactable.global_position
	instance.call("_on_interaction_requested", player.global_position)
	if not _check(instance.inventory.count(item.id) == 1, "interaction adds item once"):
		return
	var items_label: Label = instance.get_node("Interface/InventoryPanel/Margin/Column/Items")
	if not _check(items_label.text == "%s x1" % item.display_name, "inventory shows item name"):
		return
	instance.call("_on_interaction_requested", player.global_position)
	if not _check(instance.inventory.count(item.id) == 1, "interaction cannot replay reward"):
		return

	results.append("room bounds")
	results.append("player movement")
	results.append("interaction distance")
	results.append("inventory display")
	instance.queue_free()
	instance = null
	scene = null
	item = null
	await process_frame
	for result in results:
		print("ok - %s" % result)
	quit(0)

func _check(condition: bool, message: String) -> bool:
	if condition:
		return true
	push_error("failed - %s" % message)
	quit(1)
	return false
