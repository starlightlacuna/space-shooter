extends State

@export var attack_state: State

@onready var timer = $Timer

var transition_to_attack: bool

func _ready():
	assert(attack_state, "Attack State not set!")

func enter(message: Dictionary = {}):
	super(message)
	transition_to_attack = false
	timer.start()

func process(delta):
	if transition_to_attack:
		var transition = StateTransition.new()
		transition.target_state = attack_state
		return transition
	if !owner.player:
		return
	var direction_to_player = owner.global_position.direction_to(owner.player.global_position)
	owner.global_rotation = Vector2.UP.angle_to(direction_to_player)

func _on_timer_timeout():
	transition_to_attack = true
