extends Area2D

class_name AutoCannonProjectile

@export var speed = 200
@export var damage = 10

func _physics_process(delta):
	#var direction = Vector2.UP.rotated(rotation)
	
	# This seems to work just fine?
	var direction = Vector2.UP
	position += direction * speed * delta

func set_speed(value):
	speed = value

func _on_visible_on_screen_notifier_2d_screen_exited():
	# TODO: Use object pools for projectiles!
	queue_free()

func _on_hurtbox_component_body_entered(body):
	print("Hit %s" % body.name)
	queue_free()
	var health_component = body.get_node_or_null("HealthComponent") as HealthComponent
	if health_component:
		var damager = Damager.new()
		damager.amount = damage
		health_component.damage(damager)
