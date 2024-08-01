extends State

@export var reload_state: State

var transition_to_reload: bool

func _ready() -> void:
	assert(reload_state, "Reload State not set!")

func enter(_message: Dictionary = {}) -> void:
	transition_to_reload = false
	var animation_tree: AnimationTree = owner.get_node("AnimationTree")
	var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
	playback.travel("Kla'ed Torpedo Ship_attack")

func process(_delta: float) -> StateTransition:
	if !transition_to_reload:
		return
	var state_transition: StateTransition = StateTransition.new()
	state_transition.target_state = reload_state
	return state_transition
	
func exit() -> void:
	pass

func transition() -> void:
	transition_to_reload = true
