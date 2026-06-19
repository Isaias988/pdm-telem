import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> updateWidget() async {
    await HomeWidget.saveWidgetData('title', 'Flutter Widget');
    await HomeWidget.saveWidgetData('message', 'Atualizado!');
    await HomeWidget.updateWidget(name: 'MyWidgetProvider');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Demo - Isaias Silva')),
      body: Center(
        child: ElevatedButton(
          onPressed: updateWidget,
          child: const Text('Atualizar Widget'),
        ),
      ),
    );
  }
}
