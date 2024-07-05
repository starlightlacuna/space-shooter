extends AnimatedSprite2D

@export var cooldown := 0.5

const PROJECTILE_PATH := "res://scenes/auto_cannon_projectile.tscn"
var is_firing := true
var can_fire := true

@onready var source1 = $ProjectileSource1
@onready var source2 = $ProjectileSource2
@onready var cooldown_timer = $Cooldown

func _ready():
	ResourceLoader.load_threaded_request(PROJECTILE_PATH)

func _process(_delta):
	if !(is_firing && can_fire):
		return
	
	#var projectile1 = ResourceLoader.load_threaded_get(PROJECTILE_PATH).instantiate()
	#projectile1.position = source1.position
	
	#var projectile2 = ResourceLoader.load_threaded_get(PROJECTILE_PATH).instantiate()
	#projectile2.position = source2.position
	
	play("firing")
	
	can_fire = false
	cooldown_timer.wait_time = cooldown
	cooldown_timer.start()

func _on_cooldown_timeout():
	can_fire = true


func _on_animation_finished():
	if get_animation() == "firing":
		play("idle")
