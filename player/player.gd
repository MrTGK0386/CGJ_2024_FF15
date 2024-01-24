extends CharacterBody2D

const max_speed = 600
const accel = 1500
const friction = 600

var direction = 8

var input = Vector2.ZERO

#Attacks
var laser = preload("res://projectile/laser_proj.tscn")

#AttacksNode
@onready var laserTimer = get_node("Attack/laser_proj_timer")
@onready var laserAttackTimer = get_node("Attack/laser_proj_timer/laser_proj_attack_timer")

#Laser
var laser_ammo = 0
var laser_baseAmmo = 1
var laser_attackspeed = 1.5
var laser_level = 0
var spell_cooldown = 0

#EnemyRelated
var enemy_close = []

func _ready():
	attack()

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
		
		
func attack():
	if laser_level > 0:
		laserTimer.wait_time = laser_attackspeed * (1-spell_cooldown)
		if laserTimer.is_stopped():
			laserTimer.start()


func _on_laser_proj_timer_timeout():
	laser_ammo += laser_baseAmmo
	laserAttackTimer.start()


func _on_laser_proj_attack_timer_timeout():
	if laser_ammo > 0:
		var laser_attack = laser.instantiate()
		laser_attack.position = position
		laser_attack.target = get_random_target()
		laser_attack.level = laser_level
		add_child(laser_attack)
		laser_ammo -= 1
		if laser_ammo > 0:
			laserAttackTimer.start()
		else:
			laserAttackTimer.stop()
			

func get_random_target():
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP


func _on_enemy_detection_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)


func _on_enemy_detection_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)


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
