extends State

@onready var timer = $Timer

func enter(message: Dictionary = {}):
	super(message)
	timer.start()

func _on_timer_timeout():
	var animation_tree = owner.get_node("AnimationTree")
	animation_tree["parameters/playback"].travel("Kla'ed Torpedo Ship_reload")
