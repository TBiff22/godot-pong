extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

@onready var global: Node = $"/root/Globalbus"

func _on_continue_pressed() -> void:
	get_tree().paused = false
	self.queue_free()

func _on_quit_to_menu_pressed() -> void:
	global.cpu_score = 0
	print("quit to menu")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")


func _on_end_game_pressed() -> void:
	get_tree().paused = false
	global.pause_end.emit()
	self.queue_free()
