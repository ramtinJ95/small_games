extends Area2D

func _ready() -> void:
	input_pickable = true

func _input_event(viewport, event, shape_idx) -> void:
	if event is InputEventScreenTouch and event.pressed:
		if not SoundManager.currently_playing:
			SoundManager.currently_playing = true
			var sprite = $"../Sprite2D"
			var audio = $"../AudioStreamPlayer2D"
			var original_position = sprite.global_position
			var original_scale = sprite.scale
			var center_position = get_viewport().get_visible_rect().size / 2
			
			const TARGET_WIDTH = 800.0
			var texture_width = sprite.texture.get_width()
			var current_scale = sprite.scale.x
			var current_width = texture_width * current_scale
			var scale_factor = TARGET_WIDTH / current_width
			var target_scale = sprite.scale * scale_factor
			
			var tween := create_tween()
			sprite.z_index = 100
			
			tween.tween_property(sprite, "global_position", center_position, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property(sprite, "scale", target_scale, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

			audio.play()
			await audio.finished

			var return_tween := create_tween()
			return_tween.tween_property(sprite, "global_position", original_position, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
			return_tween.tween_property(sprite, "scale", original_scale, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

			await return_tween.finished
			sprite.z_index = 0
			
			SoundManager.currently_playing = false
