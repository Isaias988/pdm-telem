import 'dart:convert'; 

// Class Dependente
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }


  Map<String, dynamic> toJson() {
    return {
      'nome': this._nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  
  Map<String, dynamic> toJson() {
    return {
      'nome': this._nome,
      'dependentes': this._dependentes.map((dep) => dep.toJson()).toList(),
    };
  }
}


class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  // Método para transformar a equipe inteira em Map
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': this._nomeProjeto,
      'funcionarios': this._funcionarios.map((func) => func.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  var dep1 = Dependente('Arthur Silva');
  var dep2 = Dependente('Beatriz Silva');
  var dep3 = Dependente('Caio Costa');

 
  var func1 = Funcionario('Carlos Silva', [dep1, dep2]); 
  var func2 = Funcionario('Julia Costa', [dep3]);        
  var func3 = Funcionario('Marcos Oliveira', []);       

 
  List<Funcionario> listaFuncionarios = [func1, func2, func3];


  var equipeMovel = EquipeProjeto('Desenvolvimento de App Mobile', listaFuncionarios);


  var encoder = JsonEncoder.withIndent('  ');
  String jsonFormatado = encoder.convert(equipeMovel.toJson());

  print(jsonFormatado);
}