extends Sensor
var engine


func read() -> Dictionary:
	var dict = {}
	dict["thrust"] = engine.thrust_total * engine.thrust_percentage
	dict["thrust_percentage"] = engine.thrust_percentage
	dict["on"] = engine.on
	dict["consumption_curve"] = engine.consumption_curve
	dict["efficiency_curve"] = engine.efficiency_curve
	return dict

func _ready():
	var parent = get_parent()
	if ClassDB.is_parent_class(parent.get_class(), "Engine") or parent.get_class() == "Engine":
		engine = get_parent()
	else:
		printerr("NODE IS NOT A ENGINE")
