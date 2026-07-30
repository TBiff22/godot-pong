extends CharacterBody2D
@onready var global: Node = $"/root/Globalbus"
@onready var playerleft: CharacterBody2D = $"../playerleft"
@onready var ball: CharacterBody2D = $"../ball"
@onready var manager: Node = %manager
@onready var timer: Timer = $Timer


var rng = RandomNumberGenerator.new()
var speedfactor = rng.randf_range(0.5, 1)

func _on_timer_timeout() -> void:
	speedfactor = rng.randf_range(0.5, 0.8)
	timer.wait_time = rng.randi_range(1, 3)
	

func _physics_process(delta: float) -> void:
	velocity.x = 0
	position.x = 448
	if global.gamemode == global.gamemodes.CPU:
		if manager.outcome == manager.outcomecheck.UNDET:
			velocity.y = ball.velocity.y * speedfactor
		else:
			velocity.y = 0
	elif global.gamemode == global.gamemodes.RALLY:
		position.y = playerleft.position.y

	move_and_slide()
