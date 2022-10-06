<?php

# Configure o cabeçalho para requisições JSON
# header("Content-Type: application/json; charset=utf-8");
#Arrays Associativo: chave => valor (similar aos dicionarios do Python)
// $dicionario = [
//    'id' => 1,
//    'name' => 'Edson',
//    'user' => 'edson',
//    'password' => 123
// ];
// print(json_encode($dicionario))

header("Content-Type: application/json; charset=utf-8");

# Pegando o valor via URL de duas variáveis
$valor_1 = $_GET['valor_1'];
$valor_2 = $_GET['valor_2'];

$resposta = [
    'valor_1' => $valor_1,
    'valor_2' => $valor_2,
    'Adicao' => ($valor_1 + $valor_2),
    'Multiplicacao' => ($valor_1 * $valor_2),
    'Divisao' => ($valor_1 / $valor_2),
    'Subtracao' => ($valor_1 - $valor_2),
    'Par/Impar' => ($valor_1 + $valor_2),
];

# Mostrando os dados no navegador via JSON
print(json_encode($resposta));

# Usando a mesma lógica, como implementar operações diferentes no mesmo arquivo
# Dica: o IF é igual do JAVA e do C/C++

