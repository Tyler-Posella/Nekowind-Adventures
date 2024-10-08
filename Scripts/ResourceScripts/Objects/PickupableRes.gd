class_name PickupableRes
extends Resource

# Export Variables
@export var normal_texture : Texture
@export var item : ItemRes

# Functions
func get_item():
	return item
	
func get_texture():
	return normal_texture
