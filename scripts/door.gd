extends StaticBody2D

@export var coordinates : Vector2 = Vector2(0.0, -1.0)
@export var room_to_load : String = "res://scenes/house.tscn"

func _on_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(room_to_load)
