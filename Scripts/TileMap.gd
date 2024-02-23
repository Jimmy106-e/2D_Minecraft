extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_terrain()

func generate_terrain():
	for x in range(0,50):
		for y in range(6,65):
			#Random gravel or stone below y = 7
			if y > 9:
				var stone_gravel = randi_range(0,2)
				if stone_gravel > 0:
					set_cell(0,Vector2i(x,y+1),1,Vector2i(1,0))
				else:
					set_cell(0,Vector2i(x,y+1),1,Vector2i(0,0))
			#If grass put dirt below
			elif get_cell_atlas_coords(0,Vector2i(x,y)) == Vector2i(3,0):
				set_cell(0,Vector2i(x,y+1),1,Vector2i(2,0))
			#If dirt put stone below
			elif get_cell_atlas_coords(0,Vector2i(x,y)) == Vector2i(2,0):
				set_cell(0,Vector2i(x,y+1),1,Vector2i(1,0))
			#If stone put stone below
			elif get_cell_atlas_coords(0,Vector2i(x,y)) == Vector2i(1,0):
				set_cell(0,Vector2i(x,y+1),1,Vector2i(1,0))
			#Set bedrock
			if y == 64:
				set_cell(0,Vector2i(x,y),1,Vector2i(1,1))
