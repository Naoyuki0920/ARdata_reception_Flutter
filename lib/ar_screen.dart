import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARScreen extends StatefulWidget {
  const ARScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ARScreenState createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Viewer'),
      ),
      body: ModelViewer(
        src: 'http://192.168.186.79:5000/', // GLBファイルのパスを指定
        alt: '3D Model',
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// class ARScreen extends StatefulWidget {
//   final String directory;
//   final String fileName;
//   const ARScreen({super.key, required this.directory, required this.fileName});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ARScreenState createState() => _ARScreenState();
// }

// class _ARScreenState extends State<ARScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ModelViewer(
//         // src: "$widget.directory/$widget.fileName", // GLBファイルのパスを指定
//         src: 'http://192.168.186.79:5000/',
//         alt: '3D Model',
//         ar: true,
//         autoRotate: true,
//         cameraControls: true,
//       ),
//     );
//   }
// }
