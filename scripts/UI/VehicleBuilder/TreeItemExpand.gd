class_name TreeItemExpand
extends VBoxContainer

func _on_ExpandButton_toggled(button_pressed):
	get_node("MarginContainer").visible = !button_pressed

func add_item(item):
	$MarginContainer.add_child(item)
