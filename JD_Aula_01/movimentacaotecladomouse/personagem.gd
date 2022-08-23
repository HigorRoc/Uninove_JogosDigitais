##
# Aprendendo a trabalhar com movimentação de objetos
# Movimentação do teclado e do mouse
##

# importa a classe para utilização
extends KinematicBody2D

export(int) var speed = 200

var velocity = Vector2()

func get_input():
	# captura a localização do mouse
	look_at(get_global_mouse_position())

	velocity = Vector2()
	if Input.is_action_pressed('ui_left'):
		velocity = Vector2(-speed, 0).rotated(rotation)

	if Input.is_action_pressed('ui_right'):
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
