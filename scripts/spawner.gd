extends Node2D

@export var player: Player

func _ready():
	#assert(player, "Player not set!")
	
	var torpedo_ship_scene = preload("res://scenes/spacecraft/kla'ed/kla'ed_torpedo_ship.tscn")
	var torpedo_ship = torpedo_ship_scene.instantiate()
	add_child(torpedo_ship)
	torpedo_ship.initialize(player)
	torpedo_ship.global_position = Vector2(450, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
