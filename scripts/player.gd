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

@onready var bodySprite = $Body

func _ready():
	assert(projectiles_node != null, "Projectiles Node not set!")
	$AutoCannon.set_projectiles_node(projectiles_node)
	#var projectiles_node = get_node(projectiles_node_path)
	#print(projectiles_node.name)

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#if direction != Vector2.ZERO:
		#print(direction)
	
	var next_position: Vector2 = direction * speed * delta
	
	move_and_collide(next_position)

func set_frame(frame: HealthFrame) -> void:
	match frame:
		HealthFrame.HEALTHY:
			bodySprite.texture = load("res://assets/Main Ship - Base - Full health.png")
		HealthFrame.SLIGHTLY_DAMAGED:
			bodySprite.texture = load("res://assets/Main Ship - Base - Slight damage.png")
		HealthFrame.DAMAGED:
			bodySprite.texture = load("res://assets/Main Ship - Base - Damaged.png")
		HealthFrame.HEAVILY_DAMAGED:
			bodySprite.texture = load("res://assets/Main Ship - Base - Very damaged.png")
