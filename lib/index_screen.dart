import 'package:data_reception/download_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ARアプリ")),
        body: Center(
          child: FilledButton(
              onPressed: () {
                requestPermission();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DownloadScreen()),
                );
              },
              child: const Text("AR表示")),
        ));
  }

  Future<void> requestPermission() async {
    if (await Permission.storage.status.isDenied) {
      await Permission.storage.request();
    }
  }
}
