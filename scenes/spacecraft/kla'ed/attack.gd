extends State

@export var reload_state: State

var transition_to_reload := false

func _ready():
	assert(reload_state, "Reload State not set!")

func enter(message: Dictionary = {}):
	super(message)
	var animation_tree = owner.get_node("AnimationTree")
	animation_tree["parameters/playback"].travel("Kla'ed Torpedo Ship_attack")

func process(delta: float):
	if !transition_to_reload:
		return
	var state_transition = StateTransition.new()
	state_transition.target_state = reload_state
	return state_transition

func transition():
	transition_to_reload = true
