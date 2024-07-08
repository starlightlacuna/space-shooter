extends Node

class_name HealthComponent

signal zeroed

@export var max_health: int = 100

@onready var health = max_health

func damage(damager: Damager):
	health -= damager.amount
	if health <= 0:
		zeroed.emit()

func heal(amount: int):
	health = min(max_health, health + amount)
