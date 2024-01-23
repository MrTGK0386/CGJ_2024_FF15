extends CharacterBody2D

const max_speed = 600
const accel = 1500
const friction = 600

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()

func _on_tgk_gen_colider_area_entered(area):
	if area.name == "RectBas" :
		print("entered ",area.name)
	
	if area.name == "RectHaut" :
		print("entered ",area.name)
	
	if area.name == "RectGauche" :
		print("entered ",area.name)
	
	if area.name == "RectDroit" :
		print("entered ",area.name)
	
func _on_tgk_gen_colider_area_exited(area):
	print("exited ", area.name)
