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


func _on_torpedo_ship_attack_button_pressed():
	#var animation_tree = get_node("Spawner/Kla'edTorpedoShip/AnimationTree") as AnimationTree
	#var state_machine = animation_tree["parameters/playback"]
	#state_machine.travel("Kla'ed Torpedo Ship_attack")
	
	var animation_player = get_node("Spawner/Kla'edTorpedoShip/AnimationPlayer") as AnimationPlayer
	animation_player.play("Kla'ed Torpedo Ship/attack")
