extends CharacterBody2D

var inventory = Inventory.new()
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Anims : AnimationPlayer
@export var raycast : RayCast2D
@export var block_outline : Sprite2D

func _ready():
	block_outline.visible = false

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
			print(tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point())), tilemap.get_cell_atlas_coords(0,tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point()))))
			var cell_Block = tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point()))
			block_outline.position = cell_Block.map_to_local()
			block_outline.visible = true
			if Input.is_action_just_pressed("Mine"):
				if tilemap.get_cell_atlas_coords(0,cell_Block) == Vector2i(1,1):
					pass
				else:
					print_debug("Mined")
					tilemap.set_cell(0,cell_Block,-1,Vector2i(-1,-1))
		else:
			block_outline.visible = false 
	
	if $Camera2D/CanvasLayer/Inventory.is_open == true:
		raycast.enabled = false
	else:
		raycast.enabled = true

