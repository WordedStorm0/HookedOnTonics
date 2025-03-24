extends Sprite2D

# Variables for rotation
var swing_speed = 5.0 # Speed of the swing
var is_swinging = false # To track whether the sword is swinging
var swing_angle = 90.0 # Total angle of the swing
var swing_progress = 0.0 # To track the swing's progress

func _process(delta: float) -> void:
	if is_swinging:
		# Increment swing progress
		swing_progress += swing_speed * delta

		# Calculate new rotation using swing progress
		var angle = lerp(0, deg_to_rad(swing_angle), swing_progress)

		# Reverse back to original angle when swinging completes
		if swing_progress >= 1.0:
			is_swinging = false
			swing_progress = 0.0
			angle = 0

		# Apply the rotation to the sword
		rotation = angle

func swing():
	# Start the swing
	if not is_swinging:
		is_swinging = true
