extends GridContainer

var t_to_layout = "%ss"
var t_start_layout = "%ss"
var deltav_layout = "%sm/s"
var deltav_layoutk = "%skm/s"

export(NodePath) var t_to_node
export(NodePath) var t_start_node
export(NodePath) var deltav_node

# Called when the node enters the scene tree for the first time.
func _ready():
	t_to_node = get_node(t_to_node)
	t_start_node = get_node(t_start_node)
	deltav_node = get_node(deltav_node)

func t_to_changed(time):
	t_to_node.text = t_to_layout % time


func t_start_changed(time):
	t_start_node.text = t_start_layout % time


func deltav_changed(deltav):
	if deltav > 10000:
		deltav_node.text = deltav_layoutk % deltav
	else:
		deltav_node.text = deltav_layout % deltav
