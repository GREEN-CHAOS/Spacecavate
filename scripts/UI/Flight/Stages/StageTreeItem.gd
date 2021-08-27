extends TreeItemExpand


func stage_property_changed(property_name : String, new_value):
	$MarginContainer/VBoxContainer/GridContainer.call(property_name+"_changed", new_value)
