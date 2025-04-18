extends CharacterBody2D

var movement_speed : float = 2000.0
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
		currentState = States.IDLE

func perform_state_actions(delta):
	match currentState:
		States.MOVE:
			character_direction.x = Input.get_axis("ui_left", "ui_right")
			character_direction.y = Input.get_axis("ui_up", "ui_down")
			character_direction = character_direction.normalized()
			
			if character_direction.x < 0 && character_direction.y == 0:
				$AnimatedSprite2D.animation = "f_walk_l"
			if character_direction.x > 0 && character_direction.y == 0:
				$AnimatedSprite2D.animation = "f_walk_r"
			if character_direction.y < 0:
				$AnimatedSprite2D.animation = "b_walk"
			if character_direction.y > 0:
				$AnimatedSprite2D.animation = "f_walk_r"
			
			velocity = character_direction * movement_speed * delta
		
		States.IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, movement_speed * delta)
			$AnimatedSprite2D.animation = "idle"
