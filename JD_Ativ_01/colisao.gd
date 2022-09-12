extends Area2D

onready var path_follow = get_parent()
export var speed = 2

func _ready():
	pass

func _physics_process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func _on_colisao_body_entered(body):
	if body.name == "player":
		body.take_damage()
	pass
