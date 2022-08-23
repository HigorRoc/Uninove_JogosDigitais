extends KinematicBody2D # Herença

# Aprender a realizar a movimentaçãode objetos
# conehcido como 8-way movement

# Salve a variável junto com o recuso que ela está conectada,
# tornando a variável editável pelo editor
export(int) var speed = 200

# A variável a seguir armazena as coordenadas x e y
var velocity = Vector2() # matriz

# definir uma função sem parâmetros para realizar a movimentação
func get_input():
	# pega as coordenadas atuais
	velocity = Vector2()
	
	# verificar a tecla pressionada para realizar o movimento
	if Input.is_action_pressed("ui_right"): # direita
		velocity.x += 1 # aumenta um ponto na coordenada x
		
	if Input.is_action_pressed("ui_left"): # esquerda
		velocity.x -= 1 # diminui um ponto na coordenada x
		
	if Input.is_action_pressed("ui_down"): # baixo
		velocity.y += 1 # aumenta um ponto na coordenada y
		
	if Input.is_action_pressed("ui_up"): # cimna
		velocity.y -= 1 # diminui um ponto na coordenada y
		
	# atribuo o novo valor da posição (normalizada) multiplicando pela velocidade
	velocity = velocity.normalized() * speed
	
	return velocity
	
func _physics_process(delta):
	get_input()
	
	# método que faz "desliza" o objeto e guarda a posição (x,y)
	velocity = move_and_slide(velocity)
