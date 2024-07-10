extends CharacterBody2D

var player: Player

enum State { Move, Seek, Attack, Reload, Disable }

func _init():
	pass

func _physics_process(delta):
	move_and_slide()

func _on_health_component_zeroed():
	queue_free()

func initialize(p_player: Player):
	player = p_player
