##
# Aprendendo a trabalhar com movimentação de objetos
# Este movimento é conhecido como: Asteroids-movement
##

extends KinematicBody2D

export(int) var speed = 200
export(float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()

	# rotaciona o objeto para a direita
	if Input.is_action_pressed('ui_down'):
		rotation_dir += 1

	# rotaciona o objeto par a esquerda
	if Input.is_action_pressed('ui_up'):
		rotation_dir -= 1

	# desloca o objeto para direita
	if Input.is_action_pressed('ui_right'):
		velocity = Vector2(speed, 0).rotated(rotation)

	# desloca o objeto para a esquerda
	if Input.is_action_pressed('ui_left'):
		velocity = Vector2(-speed, 0).rotated(rotation)


func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
