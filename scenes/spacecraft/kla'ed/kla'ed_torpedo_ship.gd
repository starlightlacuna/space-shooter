extends CharacterBody2D

var player: Player
var torpedo_sources := []
var torpedo_index := 0
var projectiles_node: Node
var torpedo_scene := preload("res://scenes/spacecraft/kla'ed/kla'ed_torpedo.tscn")

enum State { Move, Seek, Attack, Reload, Disable }

func _ready():
	#assert(projectiles_node, "Projectiles Node not set!")
	
	for n in 6:
		torpedo_sources.push_back(get_node("TorpedoSource%s" % n))

func _physics_process(delta):
	move_and_slide()

func _on_health_component_zeroed():
	queue_free()

func initialize(p_player: Player, p_projectiles_node: Node):
	player = p_player
	projectiles_node = p_projectiles_node

func spawn_torpedo():
	var torpedo = torpedo_scene.instantiate()
	projectiles_node.add_child(torpedo)
	var torpedo_source = torpedo_sources[torpedo_index]
	torpedo.global_position = torpedo_source.global_position
	torpedo.global_rotation = torpedo_source.global_rotation
	torpedo_index = (torpedo_index + 1) % torpedo_sources.size()
