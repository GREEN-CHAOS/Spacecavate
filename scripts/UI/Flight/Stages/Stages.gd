extends TreeItemExpand

var stage_scene = preload("res://scenes/UI/Flight/Stage/StagesTreeItem.tscn")


func stage_new(stage_name):
	print("created stage")
	var stage = stage_scene.instance()
	stage.name = stage_name
	stage.get_node("HBoxContainer/Label").text = stage_name
	$MarginContainer/VBoxContainer.add_child(stage)

func stage_property_changed(stage_name : String, property : String, new_value):
	var stage = get_node_or_null(stage_name)
	if stage != null:
		stage.set(property, new_value)
	else:
		return "stage not found (try adding it first)"
