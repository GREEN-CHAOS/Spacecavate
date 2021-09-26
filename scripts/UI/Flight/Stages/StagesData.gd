extends GridContainer

var deltav_layout := "%sm/s"
var deltav_layoutk := "%skm/s"
var fuel_percentage_layout := "%s%"
var fuel_liters_layout := "l"
var fuel_liters_layoutk := "kl"


export(NodePath) var deltav_node
export(NodePath) var fuel_percentage_node
export(NodePath) var fuel_liters_node
# Called when the node enters the scene tree for the first time.
func _ready():
	deltav_node = get_node(deltav_node)
	fuel_percentage_node = get_node(fuel_percentage_node)
	fuel_liters_node = get_node(fuel_liters_node)

func deltav_changed(deltav):
	if deltav > 10000:
		deltav_node.text = deltav_layoutk % deltav
	else:
		deltav_node.text = deltav_layout % deltav

func fuel_percentage_changed(fuel_percentage):
	fuel_percentage_node.text = fuel_percentage_layout % fuel_percentage

func fuel_liters_changed(fuel_liters):
	fuel_liters_node.text = fuel_liters_layout % fuel_liters
