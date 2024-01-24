extends Control

@export
var volume: float =1

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundFx
	print(volume)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

