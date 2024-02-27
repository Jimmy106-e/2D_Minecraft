extends Node2D

@export var block_outline : Polygon2D
@export var raycast : RayCast2D

func _process(delta):
	if raycast.is_colliding() && raycast.get_collider() is TileMap:
		var tilemaps = get_tree().get_nodes_in_group("Tilemaps")
		var tilemap = tilemaps[0]
		var cell_Block = tilemap.local_to_map(tilemap.to_local(raycast.get_collision_point()))
		var block = tilemap.map_to_local(cell_Block)
		block_outline.position = block * Vector2(5,5)
		
		block_outline.visible = true
	else:
		block_outline.visible = false
