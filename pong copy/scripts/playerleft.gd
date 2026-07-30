extends CharacterBody2D
@onready var manager: Node = %manager


const SPEED = 500.0


func _physics_process(delta: float) -> void:
	velocity.x = 0
	position.x = -448
	var direction := Input.get_axis("up", "down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if manager.outcome != manager.outcomecheck.UNDET:
		velocity.y = 0
	move_and_slide()
