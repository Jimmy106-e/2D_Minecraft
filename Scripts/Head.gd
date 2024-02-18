extends Sprite2D

@export var raycast : RayCast2D
@export var tilemap : TileMap

func _process(delta: float) -> void:
	# Get the global mouse position
	var mouse_position = get_global_mouse_position()

	# Calculate the direction vector from the sprite's position to the mouse position
	var direction = (mouse_position - global_position).normalized()

	# Calculate the angle in radians based on the direction vector
	var angle = atan2(direction.y, direction.x)

	# Convert the angle to degrees and set the sprite's rotation
	rotation_degrees = angle * 180 / PI

	# Flip the sprite if the mouse is on the left side
	if mouse_position.x < global_position.x:
		scale.y = -5
	else:
		scale.y = 5
		
