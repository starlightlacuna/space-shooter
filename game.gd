extends Node

@onready var player = $Player

func _on_full_health_button_pressed():
	$Player.set_frame(Player.HealthFrame.HEALTHY)


func _on_slightly_damaged_button_pressed():
	$Player.set_frame(Player.HealthFrame.SLIGHTLY_DAMAGED)


func _on_damaged_button_pressed():
	$Player.set_frame(Player.HealthFrame.DAMAGED)


func _on_very_damaged_button_pressed():
	$Player.set_frame(Player.HealthFrame.HEAVILY_DAMAGED)


func _on_toggle_firing_button_pressed():
	$Player/Body/Weapon.is_firing = !$Player/Body/Weapon.is_firing
