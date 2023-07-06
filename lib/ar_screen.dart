import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModelViewer(
          src: 'http://192.168.186.79:5000/',
          // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ));
  }
}
