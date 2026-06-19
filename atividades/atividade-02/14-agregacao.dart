import 'dart:convert';

class Endereco {
 String logradouro;
 int numero;
 String bairro;
 String cidade;
 String estado;

 Endereco(
 this.logradouro,
 this.numero,
 this.bairro,
 this.cidade,
 this.estado
 );

 Map<String, dynamic> toMap() {
 return {
 'logradouro': logradouro,
 'numero': numero,
 'bairro': bairro,
 'cidade': cidade,
 'estado': estado,
 };
 }
 }

class Pessoa {
 String nome;
 int idade;
 Endereco endereco; // AGREGAÇÃO

 Pessoa(this.nome, this.idade, this.endereco);

 Map<String, dynamic> toMap() {
 return {
 'nome': nome,
 'idade': idade,
 'endereco': endereco.toMap(),
 };
 }
 }

void main() {
 Endereco endereco = Endereco(
 'Rua das Flores',
 123,
 'Centro',
 'Fortaleza',
 'CE',
 );

 Pessoa pessoa = Pessoa(
 'Leonardo Moreira Cruz',
 25,
 endereco,
 );

 String jsonPessoa = jsonEncode(pessoa.toMap());

 print(jsonPessoa);
 }