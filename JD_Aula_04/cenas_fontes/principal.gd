extends Node2D

func _ready():
	pass

func _on_Button_pressed():
	# aqui vamos pegar o Node da arvore para trocar a cena
	get_tree().change_scene("res://cena_2.tscn")
