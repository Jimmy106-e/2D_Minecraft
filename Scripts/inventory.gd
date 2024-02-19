extends Control

@onready var inventory : Inventory = preload("res://PlayerInv.tres")
@onready var slots = $NinePatchRect/GridContainer.get_children()

var is_open = false

func _ready():
	update_slots()
	close()

func update_slots():
	for i in range(min(inventory.Items.size(), slots.size())):
		slots[i].update(inventory.Items[i])

func _process(delta):
	if Input.is_action_just_pressed("E"):
		if is_open:
			close()
		else:
			open()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
