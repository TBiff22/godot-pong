extends Control
@onready var global: Node = $"/root/Globalbus"
@onready var outcometext: RichTextLabel = $RichTextLabel

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_to_menu_pressed() -> void:
	global.cpu_score = 0
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
