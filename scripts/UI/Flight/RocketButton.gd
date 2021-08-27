extends Button

signal rocket_selected(selected, rocket_name)

var rocket_name

func set_rocket_name(name: String):
	text = name
	rocket_name = name

func _toggled(button_pressed):
	emit_signal("rocket_selected",button_pressed, rocket_name)
