extends Area2D

class_name AutoCannonProjectile

@export var speed = 200

@onready var damage = $Damage.amount

func _physics_process(delta):
	#var direction = Vector2.UP.rotated(rotation)
	
	# This seems to work just fine?
	var direction = Vector2.UP
	position += direction * speed * delta

func _on_hitbox_body_entered(body):
	print("%s hit $s!" % [name, body.name])


func _on_visible_on_screen_notifier_2d_screen_exited():
	# TODO: Use object pools for projectiles!
	queue_free()

func set_speed(value):
	speed = value
