extends Node

class_name HealthComponent

signal zeroed

@export var max_health: int = 100

@onready var health: int = max_health

func damage(damager: Damager) -> void:
	health -= damager.amount
	if health <= 0:
		zeroed.emit()

func heal(amount: int) -> void:
	health = min(max_health, health + amount)
