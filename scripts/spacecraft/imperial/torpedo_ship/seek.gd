extends State

@export var attack_state: State
@export var rotation_speed := 1.0

@onready var timer = $Timer

var transition_to_attack: bool

func _ready():
	assert(attack_state, "Attack State not set!")

func enter(_message: Dictionary = {}):
	transition_to_attack = false
	timer.start()

func process(delta):
	if transition_to_attack:
		var transition = StateTransition.new()
		transition.target_state = attack_state
		return transition
	if !owner.player:
		return
	var owner_node = owner as CharacterBody2D
	var direction_to_player = owner_node.global_position.direction_to(owner_node.player.global_position)
	var world_angle_to_player = Vector2.UP.rotated(owner_node.global_rotation).angle_to(direction_to_player)
	
	owner_node.rotate(sign(world_angle_to_player) * min(abs(world_angle_to_player), delta * rotation_speed))

func exit():
	pass

func _on_timer_timeout():
	transition_to_attack = true
