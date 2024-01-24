extends Node

var mapNumber = 0
var direction = 8
var mapQueue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mapQueue.size() > 4:
		remove_child(mapQueue.pop_back())
	#for n in mapQueue.size():
		#print(mapQueue[n])

# This function generate a new Tile
func TGK_genTile(direction,currentMap):
	print("entered function genTile")
	var currentTile = get_node(currentMap)
	if direction == 0:
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,-6000)
	if direction == 2:
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map%s" %mapNumber
		newTile.position = Vector2(6000,0)
	if direction == 4:
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,6000)
	if direction == 6:
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map%s" %mapNumber
		newTile.position = Vector2(-6000,0)
	if direction == 1:
		var newTile = currentTile.duplicate()
		var newTile2 = currentTile.duplicate()
		var newTile3 = currentTile.duplicate()
		add_child(newTile)
		add_child(newTile2)
		add_child(newTile3)
		newTile.name = "Map%s" %mapNumber
		newTile2.name = "Map%s" %mapNumber
		newTile3.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,-6000)
		newTile2.position = Vector2(6000,0)
		newTile3.position = Vector2(6000,-6000)
	if direction == 3:
		var newTile = currentTile.duplicate()
		var newTile2 = currentTile.duplicate()
		var newTile3 = currentTile.duplicate()
		add_child(newTile)
		add_child(newTile2)
		add_child(newTile3)
		newTile.name = "Map%s" %mapNumber
		newTile2.name = "Map%s" %mapNumber
		newTile3.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,6000)
		newTile2.position = Vector2(6000,0)
		newTile3.position = Vector2(6000,6000)
	if direction == 5:
		var newTile = currentTile.duplicate()
		var newTile2 = currentTile.duplicate()
		var newTile3 = currentTile.duplicate()
		add_child(newTile)
		add_child(newTile2)
		add_child(newTile3)
		newTile.name = "Map%s" %mapNumber
		newTile2.name = "Map%s" %mapNumber
		newTile3.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,6000)
		newTile2.position = Vector2(-6000,0)
		newTile3.position = Vector2(-6000,6000)
	if direction == 7:
		var newTile = currentTile.duplicate()
		var newTile2 = currentTile.duplicate()
		var newTile3 = currentTile.duplicate()
		add_child(newTile)
		add_child(newTile2)
		add_child(newTile3)
		newTile.name = "Map%s" %mapNumber
		newTile2.name = "Map%s" %mapNumber
		newTile3.name = "Map%s" %mapNumber
		newTile.position = Vector2(0,-6000)
		newTile2.position = Vector2(-6000,0)
		newTile3.position = Vector2(-6000,-6000)
	print ("genTile ended")

## Those 4 functions are called when the player colide with the map's borders
#func _on_rect_haut_area_entered(area):
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
	#TGK_genTile(direction)
#
#func _on_rect_droit_area_entered(area):
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
	#TGK_genTile(direction)
#
#func _on_rect_bas_area_entered(area):
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
	#TGK_genTile(direction)
#
#func _on_rect_gauche_area_entered(area):
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
	#TGK_genTile(direction)

## Those 4 functions are called when the player exit the map's borders
#func _on_rect_haut_area_exited(area):
	#await get_tree().create_timer(1).timeout
	#direction = 8 
#
#func _on_rect_droit_area_exited(area):
	#await get_tree().create_timer(1).timeout
	#direction = 8 
#
#func _on_rect_bas_area_exited(area):
	#await get_tree().create_timer(1).timeout
	#direction = 8 
#
#func _on_rect_gauche_area_exited(area):
	#await get_tree().create_timer(1).timeout
	#direction = 8 
