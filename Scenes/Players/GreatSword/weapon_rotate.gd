extends Marker2D

@export var hero: CharacterBody2D  # Drag your character node here in the editor
@export var radius: float = 15

func _process(delta):
	#This creates a variable to grab the position of the mouse on your screen
		var mouse_position = get_global_mouse_position()
		#look_at(mouse_position)
	#This creates the direction based on the position of the mouse to the hero
		var revolution = (mouse_position - hero.position).normalized()
	#This changes the position of the sword based on the hero's position and
	#the direction it's going while keeping it in the specified radius
		global_position = hero.position + revolution * radius
