import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/repository.dart';

class GitHubService {
  Future<List<Repository>> fetchRepositories(String user) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$user/repos'),
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Repository.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar repositórios');
    }
  }
}
