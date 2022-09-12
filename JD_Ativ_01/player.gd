extends KinematicBody2D

var vida = 3
var pontos = 0
var velocity = Vector2.ZERO
export(int) var speed = 300

func get_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)

func _physics_process(delta):
	get_input()
	get_parent().get_node("campoPontos").text = "Pontos: " + str(pontos)
	get_parent().get_node("campoVidas").text = "Vidas: " + str(vida)

func add_points():
	pontos += 1

func take_damage():
	vida -= 1
	if vida <= 0:
		speed = 0
		$death.play()
		yield(get_tree().create_timer(1), "timeout")
		get_parent().get_node("campoTotalPontos").text = "Pontos ganhos do Jogador: " + str(pontos)
		queue_free()
