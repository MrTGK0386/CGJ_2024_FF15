extends CharacterBody2D

const max_speed = 600
const accel = 1500
const friction = 600

var input = Vector2.ZERO


@export var direction : int = 8

func _ready():
	pass

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



# This function is called when the player colide with the map's borders
#func _on_tgk_gen_colider_area_entered(area):
	#print("entered ",area.name)
	#if area.name == "RectHaut" :
		#print("entered ",area.name)
		#if direction != 0 && direction != 8:
			#if direction == 6:
				#direction = 7
			#if direction == 2:
				#direction = 1
		#elif direction == 4:
			#direction = 4
		#else:
			#direction = 0
		#print(direction)
		#GameScript.TGK_genTile(direction,area.get_parent())
	#if area.name == "RectDroit" :
		#print("entered ",area.name)
		#if direction != 2 && direction != 8:
			#if direction == 0:
				#direction = 1
			#if direction == 4:
				#direction = 3
		#elif direction == 6:
			#direction = 6
		#else:
			#direction = 2
		#print(direction)
		#GameScript.TGK_genTile(direction,area.get_parent())
	#if area.name == "RectBas" :
		#print("entered ",area.name)
		#if direction != 4 && direction != 8:
			#if direction == 2:
				#direction = 3
			#if direction == 6:
				#direction = 5
		#elif direction == 0:
			#direction = 0
		#else:
			#direction = 4
		#print(direction)
		#GameScript.TGK_genTile(direction,area.get_parent())
	#if area.name == "RectGauche" :
		#print("entered ",area.name)
		#if direction != 6 && direction != 8:
			#if direction == 0:
				#direction = 7
			#if direction == 4:
				#direction = 5
		#elif direction == 2:
			#direction = 2
		#else:
			#direction = 6
		#print(direction)
		#GameScript.TGK_genTile(direction,area.get_parent())

# This function is called when the player exit the map's borders
func _on_tgk_gen_colider_area_exited(area):
	await get_tree().create_timer(1).timeout
	direction = 8 

#@onready var nodeMap = get_node("%Map")
#
#func _on_tgk_gen_colider_area_entered(area):
	#if area.name == "RectHaut" :
		#print("entered ",area.name)
		#direction = 0
		#print(direction)
		#TGK_genTile(direction)
	#
	#if area.name == "RectDroit" :
		#print("entered ",area.name)
		#direction = 2
		#print(direction)
		#TGK_genTile(direction)
		#
	#if area.name == "RectBas" :
		#print("entered ",area.name)
		#direction = 4
		#print(direction)
		#TGK_genTile(direction)
	#
	#if area.name == "RectGauche" :
		#print("entered ",area.name)
		#direction = 6
		#print(direction)
		#TGK_genTile(direction)
	#
#func _on_tgk_gen_colider_area_exited(area):
	#print("exited ", area.name)
	#direction = 8
	#print(direction)

func _on_tgk_gen_colider_area_entered(area):
	print(area.name)
