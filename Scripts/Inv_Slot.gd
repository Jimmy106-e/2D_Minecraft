extends Panel

@onready var item : Sprite2D = $CenterContainer/Panel/Item
@onready var stack_I = $Label
@export var not_hotbar = false

func _ready():
	stack_I.visible = false

func update(Item: InvItem):
	if !Item:
		item.visible = false
	else:
		item.visible = true
		item.texture = Item.texture
		if not_hotbar:
			pass
		else:
			if Item.stackable:
				if Item.amount > 1:
					stack_I.visible = true
					stack_I.set_text(str(Item.amount))
				else:
					stack_I.visible = false
			else:
				stack_I.visible = false
