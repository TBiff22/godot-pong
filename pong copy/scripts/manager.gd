extends Node
@onready var ball: CharacterBody2D = $"../ball"
@onready var global: Node = $"/root/Globalbus"

var replay = preload("res://scenes/result_screen.tscn")
var pause = preload("res://scenes/pause_menu.tscn")
enum outcomecheck {WIN, LOSE, UNDET, PAUSED}
@onready var winsound: AudioStreamPlayer2D = $winsound
@onready var losesound: AudioStreamPlayer2D = $losesound
@onready var scoretext: RichTextLabel = $scoretext

var rng = RandomNumberGenerator.new()
@export var cpuspeed = rng.randf_range(0.4, 0.73)
@export var outcome = outcomecheck.UNDET
@export var score = 0

signal endgame

func _ready():
	global.pause_end.connect(_pause_end)
	if global.gamemode == global.gamemodes.CPU:
		scoretext.text = str(global.cpu_score)

func _process(_float) -> void:
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		var pause_screen = pause.instantiate()
		add_child(pause_screen)

func _pause_end():
	outcome = outcomecheck.PAUSED
	_on_endgame()

func add_point():
	score += 1
	scoretext.text = str(score)

func _on_endgame() -> void:
	ball.queue_free()
	var result_screen = replay.instantiate()
	add_child(result_screen)
	if global.gamemode == global.gamemodes.CPU:
		if outcome == outcomecheck.WIN:
			winsound.play()
			result_screen.outcometext.text = "you win"
			global.add_score()
			print(global.cpu_score)
		elif outcome == outcomecheck.LOSE:
			losesound.play()
			result_screen.outcometext.text = "you lose"
		elif outcome == outcomecheck.PAUSED:
			losesound.play()
			result_screen.outcometext.text = "you quit"
		else:
			result_screen.outcometext.text = "what"
		scoretext.text = "wins: " + str(global.cpu_score)
	else:
		winsound.play()
		result_screen.outcometext.text = "your score is " + str(score)
