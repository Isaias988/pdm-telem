import 'package:flutter/material.dart';
import 'repository_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  void search() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RepositoryScreen(user: controller.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Usuário GitHub'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: search, child: const Text('Buscar')),
          ],
        ),
      ),
    );
  }
}
