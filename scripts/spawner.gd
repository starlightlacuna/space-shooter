extends Node2D

@export var player: Player
@export var projectiles_node: Node

func _ready() -> void:
	#assert(player, "Player not set!")
	assert(projectiles_node, "Projectiles Node not set!")
	
	var torpedo_ship_scene: PackedScene = preload("res://scenes/spacecraft/imperial/imperial_torpedo_ship.tscn")
	var torpedo_ship: ImperialTorpedoShip = torpedo_ship_scene.instantiate()
	add_child(torpedo_ship)
	torpedo_ship.initialize(player, projectiles_node)
	torpedo_ship.global_position = Vector2(450, 200)

func _process(_delta: float) -> void:
	pass
