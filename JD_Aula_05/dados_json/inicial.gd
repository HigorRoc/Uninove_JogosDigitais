extends Node2D

# primeiro procedimento a ser carregado no jogo (depois da Global)
func _ready():
	
	# verificar se existem dados gravados no arquivo de dados.json
	if Dados.carrega_dados() != null:
		var dados = Dados.carrega_dados()
		print(dados)
		
		# exemplo: ir para a tela do jogo ou ir para o Menu

func _on_gravar_pressed():
	# e agora, como gravar no arquivo?
	Dados.salva_dados($nome.text, $sobrenome.text)
	print("Dados gravados com sucesso!")


func _on_ler_pressed():
	if Dados.carrega_dados() != null:
		var dados = Dados.carrega_dados()
		print(dados)
