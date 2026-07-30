extends Area2D
@onready var manager: Node = %manager

func _on_body_entered(body: Node2D) -> void:
	manager.outcome = manager.outcomecheck.LOSE
	manager.endgame.emit()
