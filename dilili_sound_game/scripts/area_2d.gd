extends Area2D

func _ready() -> void:
	input_pickable = true  # Makes sure the Area2D receives input events

func _input_event(viewport, event, shape_idx) -> void:
	if event is InputEventScreenTouch and event.pressed:
		print("Pressed inside the sprite!")
		$"../AudioStreamPlayer2D".play()
