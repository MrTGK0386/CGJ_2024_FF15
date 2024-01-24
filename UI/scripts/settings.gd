extends Control

var selected1 = ">"
var selected2 = "<"
@onready var Selector1_text = %Selector1
@onready var Selector2_text = %Selector2 

func _ready():
	$ExitButton/ExitButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://UI/scenes/menu.tscn")

func _on_exit_button_mouse_entered():
	Selector1_text.text = str(selected1)
	Selector2_text.text = str(selected2)
	$"SelectedSound".play()


func _on_exit_button_mouse_exited():
	Selector1_text.text = str("")
	Selector2_text.text = str("")
