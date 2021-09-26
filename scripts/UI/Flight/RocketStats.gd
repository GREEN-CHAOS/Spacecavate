extends GridContainer

var height_layout := "%sm"
var height_layoutk := "%skm"
var velocity_layout :="%sm/s"
var velocity_layoutk :="%skm/s"
var deltav_layout := "%sm/s"
var deltav_layoutk := "%skm/s"
var percentage_layout := "%s%"

export(NodePath) var height_node
export(NodePath) var velocity_node
export(NodePath) var deltav_node
export(NodePath) var fuel_percentage_node

func _ready():
	height_node = get_node(height_node)
	velocity_node = get_node(velocity_node)
	deltav_node = get_node(deltav_node)
	fuel_percentage_node = get_node(fuel_percentage_node)

func height_changed(height):
	if height > 10000:
		height_node.text = height_layoutk % height
	else:
		height_node.text = height_layout % height

func velocity_changed(velocity):
	if velocity > 10000:
		velocity_node.text = velocity_layoutk % velocity
	else:
		velocity_node.text = velocity_layout % velocity

func deltav_changed(deltav):
	if deltav > 10000:
		deltav_node.text = deltav_layoutk % deltav
	else:
		deltav_node.text = deltav_layout % deltav

func fuel_percentage_changed(percentage):
	fuel_percentage_node.text = percentage_layout % percentage
