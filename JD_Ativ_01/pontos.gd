extends Area2D
class_name coiner

func _on_moeda_body_entered(body):
	$coleta.play()
	body.add_points()

func _on_coleta_finished():
	queue_free()
