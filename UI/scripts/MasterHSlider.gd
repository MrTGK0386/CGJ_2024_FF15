extends HSlider

@export
var Master : String

var bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index("Master")
	value_changed.connect(_on_value_changed)
	$".".value = Menu.volume
	$"../HBoxContainer/VolumeValue".text=str(Menu.volume*100).pad_decimals(0)

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	Menu.volume=value
	$"../HBoxContainer/VolumeValue".text=str(Menu.volume*100).pad_decimals(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
