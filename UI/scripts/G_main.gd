extends Control
var selected1 = ">"
var selected2 = "<"
@onready var Selector1_text = %Selector1
@onready var Selector2_text = %Selector2 
@onready var Selector3_text = %Selector3 
@onready var Selector4_text = %Selector4
@onready var Selector5_text = %Selector5 
@onready var Selector6_text = %Selector6
@onready var Selector7_text = %Selector7
@onready var Selector8_text = %Selector8
# Called when the node enters the scene tree for the first time.
func _ready():
	$PrametersButton/ParametersButton.grab_focus()
	$CreditsButton/CreditsButton.grab_focus()
	$ExitButton2/ExitButton.grab_focus()
	$PlayButton/PlayButton.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	$PlayButton/PlayButton.grab_focus()
	SoundFx.stopmenumusic()
	
func _on_parameters_button_pressed():
	get_tree().change_scene_to_file("res://UI/scenes/settings.tscn")
	

func _on_exit_button_pressed():
	get_tree().quit()


func _on_play_button_mouse_entered():
	Selector1_text.text = str(selected1)
	Selector2_text.text = str(selected2)
	$SelectedSound.play()

func _on_play_button_mouse_exited():
	Selector1_text.text = str("")
	Selector2_text.text = str("")

func _on_parameters_button_mouse_entered():
	Selector3_text.text = str(selected1)
	Selector4_text.text = str(selected2)
	$SelectedSound.play()


func _on_parameters_button_mouse_exited():
	Selector3_text.text = str("")
	Selector4_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")



func _on_credits_button_mouse_entered():
	Selector5_text.text = str(selected1)
	Selector6_text.text = str(selected2)
	$SelectedSound.play()

func _on_credits_button_mouse_exited():
	Selector5_text.text = str("")
	Selector6_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")


func _on_exit_button_mouse_entered():
	Selector7_text.text = str(selected1)
	Selector8_text.text = str(selected2)
	$SelectedSound.play()

func _on_exit_button_mouse_exited():
	Selector7_text.text = str("")
	Selector8_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")


func _on_play_button_focus_entered():
	Selector1_text.text = str(selected1)
	Selector2_text.text = str(selected2)
	$SelectedSound.play()
	
func _on_play_button_focus_exited():
	Selector1_text.text = str("")
	Selector2_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")

func _on_parameters_button_focus_entered():
	Selector3_text.text = str(selected1)
	Selector4_text.text = str(selected2)
	$SelectedSound.play()


func _on_parameters_button_focus_exited():
	Selector3_text.text = str("")
	Selector4_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")


func _on_credits_button_focus_entered():
	Selector5_text.text = str(selected1)
	Selector6_text.text = str(selected2)
	$SelectedSound.play()
	
func _on_credits_button_focus_exited():
	Selector5_text.text = str("")
	Selector6_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")
	

func _on_exit_button_focus_entered():
	Selector7_text.text = str(selected1)
	Selector8_text.text = str(selected2)
	$SelectedSound.play()

func _on_exit_button_focus_exited():
	Selector7_text.text = str("")
	Selector8_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")

func _on_color_rect_focus_entered():
	Selector7_text.text = str("")
	Selector8_text.text = str("")
	Selector1_text.text = str("")
	Selector2_text.text = str("")



