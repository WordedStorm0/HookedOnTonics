extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

var is_attacking: bool = false

const SPEED = 10.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Get directional input for both X and Y axes
	#Vector2 stores 2D data like the coordinates for position and direction of a
	#2D object. Here we use it to store the player input for moving on the
	#X axis (left and right) and the Y axis (up and down)
	var input_vector = Vector2(
		#move left, right, up, and down are WASD which we initialized in the Input map
		Input.get_axis("move left", "move right"),
		Input.get_axis("move up", "move down")
	)
	
	#Get left click input for attacking changing the flag state of is_attacking to true to stop
	#bugging tf out and letting the attack animation to play through
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		animation_player.play('Attack')
	
	if is_attacking and not animation_player.is_playing():
		is_attacking = false
		

	if not is_attacking:
	# Normalize the input vector to ensure consistent speed in all directions
		if input_vector.length() > 0:
			#Normalized checks the vector length which keeps the speed consistent
			#to left and right movement when you move diagonally 
			input_vector = input_vector.normalized()
			velocity = input_vector * SPEED
			animation_player.play('Walk')
		
		#flips the sprite when moving left of the x axis -1
			if input_vector.x != 0:
				animated_sprite.flip_h = input_vector.x < 0
		else:
			#move_toward sets the character's movement to 0 when there is no player
			#input
			velocity = velocity.move_toward(Vector2.ZERO, SPEED * delta)
			animation_player.play('Idle')

	# Move and slide the character in 2D space
	move_and_slide()
