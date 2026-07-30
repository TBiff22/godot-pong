extends Control
@onready var global: Node = $"/root/Globalbus"

func _on_rally_pressed() -> void:
	global.gamemode = global.gamemodes.RALLY
	get_tree().change_scene_to_file("res://scenes/main_interface.tscn")

func _on_cpu_pressed() -> void:
	global.gamemode = global.gamemodes.CPU
	get_tree().change_scene_to_file("res://scenes/main_interface.tscn")


func _on_quit_game_pressed() -> void:
	get_tree().quit()
