extends StaticBody2D

@export var coordinates : Vector2 = Vector2(0.0, -1.0)
@export var room_to_load : String = "res://scenes/house.tscn"

func _on_trigger_area_shape_entered() -> void:
	#get_tree().change_scene_to_file(room_to_load)
	print("Door oppened")
