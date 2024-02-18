extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Anims : AnimationPlayer
@export var raycast : RayCast2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Backward","Forward")
	print(direction)
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			Anims.play_backwards("Walking")
		else:
			Anims.play("Walking")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		Anims.stop()

	move_and_slide()
	
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		print(collider)
		if collider is TileMap:
			var tilemaps = get_tree().get_nodes_in_group("Tilemaps")
			var tilemap = tilemaps[0]
			print(tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point())))
			var cell_Block = tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point()))
			if Input.is_action_just_pressed("Mine"):
				tilemap.set_cell(0,cell_Block)
