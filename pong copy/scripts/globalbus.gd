extends Node

signal pause_end

enum gamemodes {CPU, RALLY, NA}
var gamemode = gamemodes.NA

@export var cpu_score = 0

func add_score():
	cpu_score += 1
