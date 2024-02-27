extends Control

var hotbar = preload("res://PlayerHot.tres")
@onready var slots = $Sprite2D/NinePatchRect/GridContainer.get_children()
var item_name

func _ready():
	update_slots()
	select(1,false)
	select(2,false)
	select(3,false)
	select(4,false)
	select(5,false)
	select(6,false)
	select(7,false)
	select(8,false)
	select(9,false)

func update_slots():
	for i in range(min(hotbar.Items.size(), slots.size())):
		slots[i].update(hotbar.Items[i])

func select(num: int, Bool:bool):
	slots[num-1].selected(Bool)
	return 
