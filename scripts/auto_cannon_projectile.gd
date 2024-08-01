class_name AutoCannonProjectile
extends Area2D

@export var speed: float = 200
@export var damage: int = 10

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.UP.rotated(rotation)
	position += direction * speed * delta

func set_speed(value: float) -> void:
	speed = value

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# TODO: Use object pools for projectiles!
	queue_free()

func _on_hurtbox_component_body_entered(body: Node) -> void:
	print("Hit %s" % body.name)
	queue_free()
	var health_component: HealthComponent = body.get_node_or_null("HealthComponent")
	if health_component:
		var damager: Damager = Damager.new()
		damager.amount = damage
		health_component.damage(damager)
