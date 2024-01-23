extends Node

var val = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func TGK_genTile(direction):
	if direction == 0:
		var currentTile = get_node("Map")
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map2"
		newTile.position = Vector2(0,-6000)
	if direction == 2:
		var currentTile = get_node("Map")
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map2"
		newTile.position = Vector2(6000,0)
	if direction == 4:
		var currentTile = get_node("Map")
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map2"
		newTile.position = Vector2(0,6000)
	if direction == 6:
		var currentTile = get_node("Map")
		var newTile = currentTile.duplicate()
		add_child(newTile)
		newTile.name = "Map2"
		newTile.position = Vector2(-6000,0)
	if direction == 1:
		var currentTile = get_node("Map")
		var newTile = currentTile.duplicate()
		var newTile2 = currentTile.duplicate()
		var newTile3 = currentTile.duplicate()
		add_child(newTile)
		add_child(newTile2)
		add_child(newTile3)
		newTile.name = "Map2"
		newTile2.name = "Map3"
		newTile3.name = "Map4"
		newTile.position = Vector2(0,-6000)
		newTile2.position = Vector2(6000,0)
		newTile3.position = Vector2(6000,-6000) 

func TGK_generationTerrain (val):
	if val%2 == 0:
		if val == 0:
			TGK_genTile("haut")
		elif val == 2:
			TGK_genTile("droit")
		elif val == 4:
			TGK_genTile("bas")
		elif val == 6:
			TGK_genTile("gauche")
	elif val < 8:
		if val == 1:
			TGK_genTile("hautDroit")
		if val == 1:
			TGK_genTile("basDroit")
		if val == 1:
			TGK_genTile("basGauche")
		if val == 1:
			TGK_genTile("hautGauche")
