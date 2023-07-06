import 'package:data_reception/ar_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArScreen(
                            directory: directory,
                            fileName: fileName,
                          )),
                );
              },
              child: const Text("ダウンロード")),
        ));
  }

  // Future<void> contentsDownload(context) async {
  //   final path = await ExternalPath.getExternalStoragePublicDirectory(
  //       ExternalPath.DIRECTORY_DOWNLOADS);
  //   try {
  //     final http.Response res = await http
  //         .get(Uri.parse(
  //             'https://modelviewer.dev/shared-assets/models/Astronaut.glb'))
  //         .timeout(const Duration(seconds: 30));
  //     final file = File("$path/Astronaut.glb");
  //     await file.create();
  //     await file.writeAsBytes(res.bodyBytes);
  //   } catch (error) {
  //     showDialog(
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: const Text("エラー"),
  //             content: Text(error.toString()),
  //             actions: [
  //               SimpleDialogOption(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               )
  //             ],
  //           );
  //         });
  //   }
  // }
}
