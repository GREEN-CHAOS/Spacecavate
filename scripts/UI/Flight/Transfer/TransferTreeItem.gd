extends TreeItemExpand


func transfer_property_changed(properyt_name : String, new_value):
	$MarginContainer/VBoxContainer/GridContainer.call(properyt_name +"_changed",new_value)
