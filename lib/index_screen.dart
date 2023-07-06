import 'package:data_reception/ar_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ARアプリ")),
        body: Center(
          child: FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArScreen()),
                );
              },
              child: const Text("AR表示")),
        ));
  }
}
