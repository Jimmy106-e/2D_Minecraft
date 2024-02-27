extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var inventory : Control
@export var Anims : AnimationPlayer
@export var raycast : RayCast2D
@export var mining_anim_player : AnimatedSprite2D

var selected : int = 0

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
#			var block = to_global(tilemap.map_to_local(cell_Block))
#			block_outline.position = block
#			block_outline.position.x = block_outline.position.x - position.x
#			block_outline.visible = true
			if Input.is_action_pressed("Mine"):
				if tilemap.get_cell_atlas_coords(0,cell_Block) == Vector2i(1,1):
					pass
				else:
					print_debug("mining")
					mining_anim_player.play("Mining")
					if mining_anim_player.animation_finished:
						print_debug("Mined")
						tilemap.set_cell(0,cell_Block,-1,Vector2i(-1,-1))
			else:
				mining_anim_player.play("default")
				mining_anim_player.stop()
#	else:
#		block_outline.visible = false 
	
	if $Camera2D/CanvasLayer/Inventory.is_open == true:
		raycast.enabled = false
	else:
		raycast.enabled = true

func _input(event):
	#select hotbar
	if event.is_action_pressed("1"):
		$Camera2D/CanvasLayer/Hotbar.select(1,true)
		selected = 1
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("2"):
		$Camera2D/CanvasLayer/Hotbar.select(2,true)
		selected = 2
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("3"):
		$Camera2D/CanvasLayer/Hotbar.select(3,true)
		selected = 3
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("4"):
		$Camera2D/CanvasLayer/Hotbar.select(4,true)
		selected = 4
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("5"):
		$Camera2D/CanvasLayer/Hotbar.select(5,true)
		selected = 5
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("6"):
		$Camera2D/CanvasLayer/Hotbar.select(6,true)
		selected = 6
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("7"):
		$Camera2D/CanvasLayer/Hotbar.select(7,true)
		selected = 7
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("8"):
		$Camera2D/CanvasLayer/Hotbar.select(8,true)
		selected = 8
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	elif event.is_action_pressed("9"):
		$Camera2D/CanvasLayer/Hotbar.select(9,true)
		selected = 9
		if $Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1] != null:
					print($Camera2D/CanvasLayer/Hotbar.hotbar.Items[selected-1].get_item_name())
		else:
			pass
	else:
		for i in range(1,10):
			if i == selected:
				pass
			else:
				$Camera2D/CanvasLayer/Hotbar.select(i,false)

