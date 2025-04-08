extends CharacterBody2D

var movement_speed : float = 60.0
var character_direction : Vector2

enum States { IDLE, MOVE }
var currentState = States.IDLE

func _physics_process(delta: float) -> void:
	move_and_slide()
