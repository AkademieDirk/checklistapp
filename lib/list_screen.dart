import 'package:flutter/material.dart';

import 'task_storage.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Aufgabe",
                suffixIcon: IconButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _addTask(_tasks, _controller.text);
                      }
                    },
                    icon: const Icon(Icons.add)),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    onPressed: () {
                      _deleteTask(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          )
        ],
      ),
    )));
  }

  // Lädt die Aufgaben aus SharedPreferences
  _loadTasks() async {
    _tasks = await TaskStorage
        .loadTasks(); // Aufgaben mit der ausgelagerten Methode laden
    setState(() {}); // UI mit den geladenen Aufgaben aktualisieren
  }

  // Fügt eine Aufgabe hinzu
  _addTask(List<String> tasks, text) async {
    await TaskStorage.addTask(
        tasks, text); // Aufgabe mit der ausgelagerten Methode hinzufügen
    setState(() {
      tasks.add(text); // ListView aktualisieren
    });
    _controller.clear(); // Textfeld leeren
  }

  // Löscht eine Aufgabe aus der Liste und speichert die aktualisierte Liste
  _deleteTask(int index) {
    setState(() {
      // Entfernt die Aufgabe an der angegebenen Stelle
      _tasks.removeAt(index);

      // Speichert die aktualisierte Liste in SharedPreferences
      TaskStorage.saveTasks(_tasks);
    });
  }
}
