// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArScreen extends StatelessWidget {
  final directory;
  final fileName;
  const ArScreen({super.key, required this.directory, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: downloadGLBFile(), // GLBファイルのダウンロード処理
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ModelViewer(
            src: snapshot.data,
            alt: '3D Model',
            ar: true,
            autoRotate: true,
            cameraControls: true,
          );
        } else if (snapshot.hasError) {
          return const Text('ファイルのダウンロードに失敗しました');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );

    // Scaffold(
    //     body: ModelViewer(
    //   src: path,
    //   // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
    //   ar: true,
    //   autoRotate: true,
    //   cameraControls: true,
    // ));
  }

  Future<File> downloadGLBFile() async {
    String url = 'http://192.168.186.79:5000/'; // FlaskサーバーのIPアドレスに置き換える
    var response = await http.get(Uri.parse(url));
    // GLBファイルの保存処理
    File file = File("$directory/$fileName");
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
