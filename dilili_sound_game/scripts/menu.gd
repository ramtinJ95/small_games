extends Control

func _on_bondgård_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	


func _on_vatten_pressed() -> void:
	get_tree().change_scene_to_file("res://vatten.tscn")


func _on_djungel_pressed() -> void:
	get_tree().change_scene_to_file("res://djungel.tscn")
