extends State

@export var seek_state: State

@onready var timer = $Timer

var transition_to_seek: bool

func _ready():
	assert(seek_state, "Seek State not set!")

func enter(message: Dictionary = {}):
	super(message)
	transition_to_seek = false
	timer.start()

func process(delta):
	if !transition_to_seek:
		return
	var state_transition := StateTransition.new()
	state_transition.target_state = seek_state
	return state_transition

func _on_timer_timeout():
	var animation_tree = owner.get_node("AnimationTree")
	animation_tree["parameters/playback"].travel("Kla'ed Torpedo Ship_reload")


func _on_animation_tree_animation_finished(anim_name):
	if !anim_name == "Kla'ed Torpedo Ship/reload":
		return
	transition_to_seek = true
