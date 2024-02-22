extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(0,50):
		for y in range(6,65):
			if y > 7:
				set_cell(0,Vector2i(x,y),1,Vector2i(randi_range(0,1),0))
			elif get_cell_atlas_coords(0,Vector2i(x,y)) == Vector2i(3,0):
				set_cell(0,Vector2i(x,y+1),1,Vector2i(2,0))
			elif get_cell_atlas_coords(0,Vector2i(x,y)) == Vector2i(2,0):
				set_cell(0,Vector2i(x,y+1),1,Vector2i(1,0))
			if y == 64:
				set_cell(0,Vector2i(x,y),1,Vector2i(1,1))
