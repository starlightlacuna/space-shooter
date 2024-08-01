extends State

@export var attack_state: State
@export var rotation_speed: float = 1.0

@onready var timer: Timer = $Timer

var transition_to_attack: bool

func _ready() -> void:
	assert(attack_state, "Attack State not set!")

func enter(_message: Dictionary = {}) -> void:
	transition_to_attack = false
	timer.start()

func process(delta: float) -> StateTransition:
	if transition_to_attack:
		var transition: StateTransition = StateTransition.new()
		transition.target_state = attack_state
		return transition
	var owner_node: ImperialTorpedoShip = owner
	if !owner_node.player:
		return
	var direction_to_player: Vector2 = owner_node.global_position.direction_to(owner_node.player.global_position)
	var world_angle_to_player: float = Vector2.UP.rotated(owner_node.global_rotation).angle_to(direction_to_player)
	
	owner_node.rotate(sign(world_angle_to_player) * min(abs(world_angle_to_player), delta * rotation_speed))
	return

func exit() -> void:
	pass

func _on_timer_timeout() -> void:
	transition_to_attack = true
