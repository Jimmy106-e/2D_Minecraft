extends Control

@onready var inventory_inv : Inventory = preload("res://PlayerInv.tres")
@onready var inventory_hot : Inventory = preload("res://PlayerHot.tres")
@onready var slots_inv = $NinePatchRect/Inventory.get_children()
@onready var slots_hot = $NinePatchRect/Hotbar.get_children()

var is_open = false

func _ready():
	update_slots()
	close()

func update_slots():
	for i in range(min(inventory_inv.Items.size(), slots_inv.size())):
		slots_inv[i].update(inventory_inv.Items[i])
	for i in range(min(inventory_hot.Items.size(), slots_hot.size())):
		slots_hot[i].update(inventory_hot.Items[i])

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
