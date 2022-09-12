extends Node2D

onready var timer = get_node("Timer")

func _process(delta):
	get_node("campoTimer").text = "Tempo restante: " + str(round(timer.time_left))

func _on_Timer_timeout():
	get_tree().reload_current_scene()
	pass # Replace with function body.
