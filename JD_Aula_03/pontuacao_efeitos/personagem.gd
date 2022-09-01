extends KinematicBody2D

var contador = 0
var velocity = Vector2()
export(int) var speed = 400 

# É a função executada na inicialização do jogo
func _ready():
	get_parent().get_node("placar").text = "Pontos: " + str(contador)

# É a função para realizar a movimentação do personagem
func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"): # direita
		velocity.x += 1
		
	if Input.is_action_pressed("ui_left"): # esquerda
		velocity.x -= 1
		
	if Input.is_action_pressed("ui_down"): # baixo
		velocity.y += 1
		
	if Input.is_action_pressed("ui_up"): # cima
		velocity.y -= 1
		
	velocity = velocity.normalized() * speed
	
	return velocity
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
# .
# .
# . 
# Funções diretas pelo Area2D
func _on_Area2D_body_entered(body):
	$coleta.play()
	
	if "item_01" in body.name:
		if contador > 2:
			get_parent().get_node("item_01").hide()
			get_parent().get_node("item_01/colisao_item_01").set_deferred("disabled", true)
			
			$morreu.play()
			contador = 0
		
		contador += 1
		get_parent().get_node("placar").text = "Pontos: " + str(contador)
			
	#if "item_02" in body.name:
	#	get_parent().get_node("item_02").hide()
	#	get_parent().get_node("item_02/colisao_item_02").set_deferred("disabled", true)
	#	contador += 1
	#	get_parent().get_node("placar").text = "Pontos: " + str(contador)
	
	#if "item_03" in body.name:
	#	get_parent().get_node("item_03").hide()
	#	get_parent().get_node("item_03/colisao_item_03").set_deferred("disabled", true)
	#	contador += 1
	#	get_parent().get_node("placar").text = "Pontos: " + str(contador)
		
func _on_Area2D_body_exited(body):
	pass
	
func _on_morreu_finished():
	get_parent().get_node("item_01").show()
	get_parent().get_node("item_01/colisao_item_01").set_deferred("disabled", false)
