extends Node


func load_main_menu():
	var menu_scene = load("res://Scenes/UI/Menus/MainMenu/MainMenu.tscn")
	var main_menu = menu_scene.instantiate()
	Utils.get_ui_node().add_child(main_menu)

	
func start_new_game():
	# Instantiate start level
	var level_scene = load("res://Scenes/Levels/Start.tscn")
	var level = level_scene.instantiate()
	Utils.set_level(level)
	get_tree().get_first_node_in_group("LevelNode").add_child(level)
	# Instantiate player
	var player_scene = load("res://Scenes/Objects/Player.tscn")
	var player = player_scene.instantiate()
	Utils.set_player(player)
	get_tree().get_first_node_in_group("PlayerNode").add_child(player)
	# Remove menu inventory
	Utils.get_ui().queue_free()
	# Add player ui
	var ui_scene = load("res://Scenes/UI/GameUI/PlayerUI.tscn")
	var ui = ui_scene.instantiate()
	Utils.set_ui(ui)
	get_tree().get_first_node_in_group("UINode").add_child(ui)
	# New game prompt
	var popup_scene = load("res://Scenes/UI/GamePrompts/WelcomeGamePrompt.tscn")
	var new_popup = popup_scene.instantiate()
	Utils.get_ui().set_popup(new_popup)
	

func start_loaded_game(game_dir):
	# Initialize new level and add it to the game tree
	var current_level_scene = load("res://Scenes/Levels/Start.tscn")
	var current_level = current_level_scene.instantiate()
	Utils.get_level_node().add_child(current_level)
	Utils.set_level(current_level)
	# Load player
	var player_directory = (SaveManager.get_current_save() + "/PlayerData.json")
	var current_player = SaveManager.load_node(player_directory)
	Utils.get_player_node().add_child(current_player)
	# Remove existing menu
	Utils.get_ui().queue_free()
	#Add player ui
	var new_ui_scene = preload("res://Scenes/UI/GameUI/PlayerUI.tscn")
	var current_ui = new_ui_scene.instantiate()
	Utils.get_ui_node().add_child(current_ui)
	Utils.set_ui(current_ui)
	

func _on_game_options():
	pass
	
	
func _on_game_quit():
	get_tree().quit()


func return_to_menu():
	unload_game()
	load_main_menu()
	
	
func unload_game():
	get_tree().get_first_node_in_group("UI").queue_free()
	get_tree().get_first_node_in_group("Level").queue_free()
	get_tree().get_first_node_in_group("Player").queue_free()
	
	
func start():
	load_main_menu()
