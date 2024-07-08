extends CharacterBody2D

func _physics_process(_delta):
	move_and_slide()

func _on_health_component_zeroed():
	queue_free()
