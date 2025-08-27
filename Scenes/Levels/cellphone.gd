extends CharacterBody2D


var player

func _ready() -> void:
	player = get_node("/root/Test Level/GreatSword Hero")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 20.0
	move_and_slide()
