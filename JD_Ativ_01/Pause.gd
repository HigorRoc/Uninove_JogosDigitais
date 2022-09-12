extends Node

export(bool) var can_toggle_pause: bool = true

func _process(delta):
	if Input.is_action_just_pressed("R"):
		if !get_tree().paused:
			pause()
		else:
			resume()

func pause():
	if can_toggle_pause:
		get_tree().set_deferred("paused", true)

func restart():
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().reload_current_scene()

func resume():
	if can_toggle_pause:
		get_tree().set_deferred("paused", false)
