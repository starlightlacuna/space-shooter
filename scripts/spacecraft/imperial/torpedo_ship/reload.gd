extends State

@export var seek_state: State

@onready var timer: Timer = $Timer

var transition_to_seek: bool

func _ready() -> void:
	assert(seek_state, "Seek State not set!")

func enter(_message: Dictionary = {}) -> void:
	transition_to_seek = false
	timer.start()

func process(_delta: float) -> StateTransition:
	if !transition_to_seek:
		return
	var state_transition := StateTransition.new()
	state_transition.target_state = seek_state
	return state_transition

func _on_timer_timeout() -> void:
	var animation_tree: AnimationTree = owner.get_node("AnimationTree")
	var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
	playback.travel("Kla'ed Torpedo Ship_reload")

func exit() -> void:
	pass

func _on_animation_tree_animation_finished(anim_name: String) -> void:
	if !anim_name == "Kla'ed Torpedo Ship/reload":
		return
	transition_to_seek = true
