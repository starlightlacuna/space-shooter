extends CharacterBody2D

class_name Player

enum HealthFrame {
	HEALTHY,
	SLIGHTLY_DAMAGED,
	DAMAGED,
	HEAVILY_DAMAGED
}

@export var speed: int = 200
@export var projectiles_node: Node

var frames: Dictionary = {}

@onready var body_sprite = $Body

func _ready():
	assert(projectiles_node != null, "Projectiles Node not set!")
	$AutoCannon.set_projectiles_node(projectiles_node)
	
	frames[HealthFrame.HEALTHY] = preload("res://assets/main_ship/base/Main Ship - Base - Full health.png")
	frames[HealthFrame.SLIGHTLY_DAMAGED] = preload("res://assets/main_ship/base/Main Ship - Base - Slight damage.png")
	frames[HealthFrame.DAMAGED] = preload("res://assets/main_ship/base/Main Ship - Base - Damaged.png")
	frames[HealthFrame.HEAVILY_DAMAGED] = preload("res://assets/main_ship/base/Main Ship - Base - Very damaged.png")

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var next_position: Vector2 = direction * speed * delta
	
	move_and_collide(next_position)

func set_frame(frame: HealthFrame) -> void:
	body_sprite.texture = frames[frame]
