extends Node2D

# configurar manualmente os dados de login
var data_to_send = {
	"type":"login",
	"user":"higor.rocha",
	"password":"higor123"
}

func _ready():
	# configurar o envio e recebimento de dados
	var var_post = JSON.print(data_to_send)
	var header = ["Content-Type: application/json"]
	var url = "https://apigames.000webhostapp.com/user.php"
	var use_ssl = false # porque não tem SSL ainda
	$HTTPRequest.request(url, header, use_ssl, HTTPClient.METHOD_POST, var_post)
	
func _on_Timer_timeout():
	get_tree().change_scene("res://cena2.tscn")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# pega os dados retornados pela API
	var json = JSON.parse(body.get_string_from_utf8())
	
	#testando erros
	if(json.result['data'] == 'err'):
		if(json.result['value'] == "Dados inválidos"):
			print(json.result['value'])
			return # para de executar
		
		if(json.result['value'] == "Usuário não localizado"):
			print(json.result['value'])
			return # para de executar
	
	# se tudo deu certo
	get_tree().change_scene("res://cena2.tscn") # próxima tela
	print('id..: ', json.result["id"])
	print('user: ', json.result["user"])
	print('nome: ', json.result["name"])
