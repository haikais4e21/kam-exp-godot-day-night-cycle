extends Node

var time_of_day = 0.0
var cycle_duration = 60.0
var light = null
var environment = null

func _ready():
	light = get_node("../DirectionalLight")
	environment = get_node("../WorldEnvironment")
	set_process(true)

func _process(delta):
	time_of_day += delta / cycle_duration
	if time_of_day > 1.0:
		time_of_day -= 1.0
	update_light_and_environment()

func update_light_and_environment():
	var light_rotation = Vector3(0, 360 * time_of_day, 0)
	light.transform = Basis(light_rotation).scaled(light.transform.origin)
	var ambient_light_color = Color.lerp(Color(0.2, 0.2, 0.2), Color(0.1, 0.1, 0.3), time_of_day)
	environment.ambient_light_color = ambient_light_color