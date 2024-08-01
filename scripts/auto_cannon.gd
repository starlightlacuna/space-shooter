class_name AutoCannon
extends AnimatedSprite2D

@export_range(0.1, 5.0) var cooldown: float = 0.2
@export var projectile_speed: float = 200

var is_firing: bool = true
var can_fire: bool = true
var projectiles_node: Node

@onready var source1: Marker2D = $ProjectileSource1
@onready var source2: Marker2D = $ProjectileSource2
@onready var cooldown_timer: Timer = $Cooldown
@onready var shot_delay_timer: Timer = $ShotDelay
@onready var projectile_scene: PackedScene = preload("res://scenes/spacecraft/player/auto_cannon_projectile.tscn")

func _physics_process(_delta: float) -> void:
	if !(is_firing && can_fire):
		return
	
	# Calculate the new speed scale
	# There are 6 frames in the firing animation, so we divide by cooldown to get the FPS
	var speed: float = max(1.0, 6.0 / cooldown / 10.0)
	
	set_speed_scale(speed)
	play()
	
	can_fire = false
	cooldown_timer.wait_time = cooldown
	cooldown_timer.start()

func _on_animation_finished() -> void:
	stop()

func _on_cooldown_timeout() -> void:
	can_fire = true

func _on_shot_delay_timeout() -> void:
	fire_from_marker(source2)

func _on_frame_changed() -> void:
	if !is_firing:
		return
	
	match get_frame():
		1:
			fire_from_marker(source1)
		2:
			fire_from_marker(source2)

func fire_from_marker(marker: Marker2D) -> void:
	var projectile: AutoCannonProjectile = projectile_scene.instantiate()
	projectiles_node.add_child(projectile)
	projectile.global_position = marker.global_position
	projectile.global_rotation = marker.global_rotation
	projectile.set_speed(projectile_speed)

func set_projectiles_node(value: Node) -> void:
	projectiles_node = value
