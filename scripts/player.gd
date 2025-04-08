extends CharacterBody2D

var movement_speed : float = 60.0
var character_direction : Vector2

enum States { IDLE, MOVE }
var currentState = States.IDLE

func _physics_process(delta: float) -> void:
	
	handle_state_transitions()
	perform_state_actions(delta)
	move_and_slide()

func handle_state_transitions():
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		currentState = States.MOVE
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed * 100)
		currentState = States.IDLE
