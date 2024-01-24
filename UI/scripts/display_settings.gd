extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	# Obtenir l'instance DisplayServer
	var display_server = DisplayServer.window_get_mode()
	if display_server == 3:
		$".".button_pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_toggled(toggled_on):
	if button_pressed == true:
		DisplayServer.window_set_mode(3,0)
	else:
		DisplayServer.window_set_mode(0,0)
