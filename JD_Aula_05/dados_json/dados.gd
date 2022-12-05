extends Node2D
# Nesse arquivo vamos definir duas functions para tratar dados locais (JSON)

# constante para definir o nome do arquivos de dados
const USER_DATA = "dados.json"

# function para salvar dados em um arquivo (USER_DATA)
static func salva_dados(var_nome, var_sobrenome):
	# criar um novo objeto para um arquivo
	var file = File.new()
	
	# verifica a existência do arquivo a ser aberto
	if file.open(USER_DATA, File.WRITE) != 0:
		print("Erro ao abrir o arquivo")
		return # para a execução da função
	
	# daqui para frente só é executado se não houve erro acima
	# monta a configuração dos dados a serem salvos
	# o formato é JSON, logo é um dicionário
	# vamos montar o JSON para guardar nome e sobrenome
	var data = {
		nome      = var_nome,
		sobrenome = var_sobrenome,
		itens = [12, 10, 2]
	}
	
	# gravar os dados no arquivo
	file.store_line(to_json(data))
	
	# fechar o arquivo
	file.close()
	
		
# carrega dados armazenados em um arquivo informado
static func carrega_dados():
	var file = File.new()
	if not file.file_exists(USER_DATA):
		print("Arquivo não existe")
		return

	# se passou pelo passo anterior, tenta abrir o arquivo
	if file.open(USER_DATA, File.READ) != 0:
		print("Erro ao abrir o arquivo")
		return
		
	# se deu tudo certo até aqui, então "bora" carregar os dados
	var data = parse_json(file.get_line())
	file.close()
	
	return data
