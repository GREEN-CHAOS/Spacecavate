extends ScrollContainer

var only_one_selectable = true
var at_least_one_selected = true
export(PackedScene) var rocket_button

signal new_rocket_selected()

# debug rn
func _ready():
	yield(get_tree().create_timer(1.0),"timeout")
	rockets_changed()

# emitted as soon as a rocket is added to the scene
func rockets_changed():
	for node in get_child(0).get_children():
		get_child(0).remove_child(node)
	for node in get_tree().get_nodes_in_group("Rockets"):
		var button = rocket_button.instance()
		button.set_rocket_name(node.rocket_name)
		get_child(0).add_child(button)
		button.connect("rocket_selected", self,"rocket_selected")

func rocket_selected(selected, rocket_name):
	var selected_rocket
	for node in get_tree().get_nodes_in_group("Rockets"):
		if node.rocket_name == rocket_name:
			selected_rocket = node
			break
	if selected_rocket == null:
		print("ooops sth went wrong try selecting the rocket again")
		rockets_changed()
		return
	if selected:
		if only_one_selectable:
			var selected_rockets = get_tree().get_nodes_in_group("Rocket_selected")
			for i in selected_rockets:
				i.remove_from_group("Rocket_selected")
		selected_rocket.add_to_group("Rocket_selected")
		emit_signal("new_rocket_selected")
	else:
		if at_least_one_selected:
			if get_tree().get_nodes_in_group("Rocket_selected").size() == 1:
				return
		selected_rocket.add_to_group("Rocket_not_selected")
