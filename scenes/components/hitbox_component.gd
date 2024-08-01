extends Area2D

@export var health_component: HealthComponent

func damage(damager: Damager) -> void:
	if health_component:
		health_component.damage(damager)
