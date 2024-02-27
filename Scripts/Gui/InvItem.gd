extends Resource

class_name InvItem

@export var name : String
@export var texture : AtlasTexture
@export_range(1,64) var amount : int
@export var stackable : bool

func get_item_name():
	return name
