extends CharacterBody2D
@onready var global: Node = $"/root/Globalbus"
@export var ballspeed = 400
@onready var collidesound: AudioStreamPlayer2D = $collidesound
@onready var wallsound: AudioStreamPlayer2D = $wallsound
@onready var manager: Node = %manager

var rng = RandomNumberGenerator.new()
var directioncondition = rng.randi_range(1, 2)
var direction_initial = Vector2(1,1)
@onready var world_and_bounds: StaticBody2D = $"../world and bounds"


func _ready():
	if directioncondition == 1:
		velocity = Vector2(direction_initial * ballspeed)
	else:
		velocity = Vector2(-direction_initial * ballspeed)



func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collider = collision_info.get_collider_id()
		if collider == world_and_bounds.get_instance_id():
			wallsound.play()
			velocity = velocity.bounce(collision_info.get_normal())
		else:
			collidesound.play()
			velocity.x = -velocity.x *1.01
			velocity.y = velocity.bounce(collision_info.get_normal()).y * 1.01			
			if global.gamemode == global.gamemodes.RALLY:
				manager.add_point()
