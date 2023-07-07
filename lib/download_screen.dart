import 'dart:io';

import 'package:data_reception/ar_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("データダウンロード")),
        body: Center(
          child: FilledButton(
              onPressed: () async {
                String fileName = 'NeilArmstrong.glb';
                String directory =
                    (await getApplicationDocumentsDirectory()).path;
                await downloadGLBFile(directory, fileName);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ARScreen(
                          // directory: directory,
                          // fileName: fileName,
                          )),
                );
              },
              child: const Text("ダウンロード")),
        ));
  }

  Future<void> downloadGLBFile(directory, fileName) async {
    debugPrint("=========================================");
    debugPrint(directory);
    debugPrint(fileName);
    String url = 'http://192.168.186.79:5000/'; // FlaskサーバーのIPアドレスに置き換える
    var response = await http.get(Uri.parse(url));
    // GLBファイルの保存処理
    File file = File("$directory/$fileName");
    await file.writeAsBytes(response.bodyBytes);
  }
}
