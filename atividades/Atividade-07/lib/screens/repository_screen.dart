import 'package:flutter/material.dart';
import '../services/github_service.dart';
import '../models/repository.dart';
import '../widgets/repo_tile.dart';

class RepositoryScreen extends StatefulWidget {
  final String user;

  const RepositoryScreen({super.key, required this.user});

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  final GitHubService service = GitHubService();
  Future<List<Repository>>? futureRepos;

  @override
  void initState() {
    super.initState();
    futureRepos = service.fetchRepositories(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user)),
      body: FutureBuilder<List<Repository>>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            final repos = snapshot.data!;
            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                return RepoTile(repo: repos[index]);
              },
            );
          }
        },
      ),
    );
  }
}
