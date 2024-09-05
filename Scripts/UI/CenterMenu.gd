extends VBoxContainer

var current_menu : String = "Inventory"
var current_menu_obj

func _ready():
	const inventory_scene = preload("res://Scenes/UI/InventoryMenu.tscn")
	var scene = inventory_scene.instantiate()
	setMenuScene(scene)
	current_menu_obj = scene
	
func setMenuScene(scene_passed):
	if(current_menu_obj != null):
		current_menu_obj.queue_free()
		current_menu_obj = null
	$MenuRect.add_child(scene_passed)
	current_menu_obj = scene_passed

	
	
