import 'package:flutter/material.dart';
import '../models/repository.dart';

class RepoTile extends StatelessWidget {
  final Repository repo;

  const RepoTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(repo.name),
        subtitle: Text(repo.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star),
            Text(repo.stars.toString()),
          ],
        ),
      ),
    );
  }
}
