extends Node

@onready var player = $Player

func _on_toggle_firing_button_pressed():
	$Player/AutoCannon.is_firing = !$Player/AutoCannon.is_firing
