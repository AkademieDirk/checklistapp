import 'package:checklistapp/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const ListScreen()));
      //         },
      //         child: const Text("Test")),
    );
  }
}
