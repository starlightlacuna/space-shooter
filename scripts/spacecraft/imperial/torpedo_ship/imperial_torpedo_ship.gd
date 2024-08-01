class_name ImperialTorpedoShip
extends CharacterBody2D

var player: Player
var torpedo_sources: Array = []
var torpedo_index: int = 0
var projectiles_node: Node
var torpedo_scene: PackedScene = preload("res://scenes/spacecraft/imperial/imperial_torpedo.tscn")

func _ready() -> void:
	#assert(projectiles_node, "Projectiles Node not set!")
	
	for n: int in 6:
		torpedo_sources.push_back(get_node("TorpedoSource%s" % n))

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_health_component_zeroed() -> void:
	queue_free()

func initialize(p_player: Player, p_projectiles_node: Node) -> void:
	player = p_player
	projectiles_node = p_projectiles_node

func spawn_torpedo() -> void:
	var torpedo: ImperialTorpedo = torpedo_scene.instantiate()
	projectiles_node.add_child(torpedo)
	var torpedo_source: Marker2D = torpedo_sources[torpedo_index]
	torpedo.global_position = torpedo_source.global_position
	torpedo.global_rotation = torpedo_source.global_rotation
	torpedo_index = (torpedo_index + 1) % torpedo_sources.size()
