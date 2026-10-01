class_name InventoryTests
extends RefCounted

const TEST_ITEM_ID := "test_item"

static func run() -> Array[String]:
	var failures: Array[String] = []
	var inventory := Inventory.new()
	_expect(inventory.add(TEST_ITEM_ID, 1), "inventory accepts positive quantity", failures)
	_expect(inventory.count(TEST_ITEM_ID) == 1, "inventory counts added item", failures)
	_expect(inventory.has(TEST_ITEM_ID), "inventory reports existing item", failures)
	_expect(not inventory.add("", 1), "inventory rejects empty id", failures)
	_expect(not inventory.add(TEST_ITEM_ID, 0), "inventory rejects zero quantity", failures)
	_expect(not inventory.remove(TEST_ITEM_ID, 2), "inventory rejects insufficient quantity", failures)
	_expect(inventory.count(TEST_ITEM_ID) == 1, "failed removal keeps quantity", failures)
	_expect(inventory.remove(TEST_ITEM_ID, 1), "inventory removes existing item", failures)
	_expect(not inventory.has(TEST_ITEM_ID), "inventory removes empty item", failures)
	if failures.is_empty():
		return ["inventory invariants"]
	return failures

static func _expect(condition: bool, message: String, failures: Array[String]) -> void:
	if not condition:
		failures.append("FAIL - %s" % message)
