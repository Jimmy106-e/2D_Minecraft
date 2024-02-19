extends Control

var hotbar = preload("res://PlayerHot.tres")
@onready var slots = $Sprite2D/NinePatchRect/GridContainer.get_children()

func _ready():
	update_slots()

func update_slots():
	for i in range(min(hotbar.Items.size(), slots.size())):
		slots[i].update(hotbar.Items[i])
