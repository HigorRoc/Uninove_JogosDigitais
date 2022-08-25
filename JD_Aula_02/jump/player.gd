extends KinematicBody2D

var motion = Vector2() # movimentacao do player
const UP = Vector2(0, -1) # realizar o salto (tecla Seta Acima)

# configurar os elementos da física
export var speed = 200
export var gravity = 170
export var jump_force = -1300

func _physics_process(delta):
	
	motion.y += 60
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	
	# verificar o contato com o obstaculo
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force
		
	# atribuir ao novo valor
	motion = move_and_slide(motion, UP)
	
