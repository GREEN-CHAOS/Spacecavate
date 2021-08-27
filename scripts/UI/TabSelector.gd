extends HBoxContainer

signal FlightToggled(active)
signal MapToggled(active)
signal SettingsToggled(active)
signal ShipInfotoggled(active)

func _ready():
	connect_signals()
	
	
func connect_signals():
	print("connected signals tabs")
	for button in get_node("HBoxContainer").get_children():
		button.connect("pressed",self,"button_pressed",[button.name])

func button_pressed(button_name: String):
	for button in get_node("HBoxContainer").get_children():
		if button.name != button_name:
			button.pressed = false
	get_node("HBoxContainer").get_node(button_name).pressed = true
	match button_name:
		"Flight": 
			emit_signal("FlightToggled", true)
			emit_signal("MapToggled", false)
			emit_signal("SettingsToggled", false)
			emit_signal("ShipInfoToggled", false) 
		"Map":
			emit_signal("FlightToggled", false)
			emit_signal("MapToggled", true)
			emit_signal("SettingsToggled", false)
			emit_signal("ShipInfoToggled", false) 
		"Settings":
			emit_signal("FlightToggled", false)
			emit_signal("MapToggled", false)
			emit_signal("SettingsToggled", true)
			emit_signal("ShipInfoToggled", false) 
		"ShipInfo":
			emit_signal("FlightToggled", false)
			emit_signal("MapToggled", false)
			emit_signal("SettingsToggled", false)
			emit_signal("ShipInfoToggled", true) 
