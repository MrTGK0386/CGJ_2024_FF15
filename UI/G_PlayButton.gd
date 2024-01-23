extends Button

var labelLeft : Label
var labelRight : Label
# Called when the node enters the scene tree for the first time.

	
func _ready():
	labelLeft = $PButton/Selector1  # Remplacez par le nom réel de votre premier label
	labelRight = $PButton/Selector2  # Remplacez par le nom réel de votre deuxième label
	labelLeft.visible = false
	labelRight.visible = false
	
func _on_mouse_entered():
	labelLeft.visible = true
	labelRight.visible = true
	
func _on_mouse_exited():
	labelLeft.visible = false
	labelRight.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
