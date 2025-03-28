extends Marker2D

@export var great_sword_hero: Node2D

func _process(delta):
	if great_sword_hero:
		var mouse_position = get_global_mouse_position()
		look_at(mouse_position)
		
		var distance = 5.0
		position = great_sword_hero.position + (Vector2.RIGHT * distance).rotated(rotation)
