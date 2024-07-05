extends AnimatedSprite2D

@onready var damage = $Damage.amount

func _on_hitbox_body_entered(body):
	print("%s hit something!" % [name])


func _on_visible_on_screen_notifier_2d_screen_exited():
	# TODO: Use object pools for projectiles!
	queue_free()
