extends TreeItemExpand

var transfer_scene = preload("res://scenes/UI/Flight/Transfer/TransferTreeItem.tscn")

func transfer_new(transfer_name):
	print("transfer created")
	var transfer = transfer_scene.instance()
	transfer.name = transfer_name
	transfer.get_node("HBoxContainer/Label").text = transfer_name
	$MarginContainer/VBoxContainer.add_child(transfer)

func transfer_property_changed(transfer_name, property_name, new_value):
	var node = get_node_or_null(transfer_name)
	if node != null:
		node.set(property_name, new_value)
	else:
		return "transfer not found (try adding it first)"
