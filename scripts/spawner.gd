extends Node2D

@export var player: Player
@export var projectiles_node: Node

func _ready():
	#assert(player, "Player not set!")
	assert(projectiles_node, "Projectiles Node not set!")
	
	var torpedo_ship_scene = preload("res://scenes/spacecraft/imperial/imperial_torpedo_ship.tscn")
	var torpedo_ship = torpedo_ship_scene.instantiate()
	add_child(torpedo_ship)
	torpedo_ship.initialize(player, projectiles_node)
	torpedo_ship.global_position = Vector2(450, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
