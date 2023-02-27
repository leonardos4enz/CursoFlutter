import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_1/services/select_image.dart';
import 'package:flutter_1/services/upload_image.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseUpload extends StatefulWidget {
  const FirebaseUpload({super.key});

  @override
  State<FirebaseUpload> createState() => _FirebaseUploadState();
}

class _FirebaseUploadState extends State<FirebaseUpload> {
  File? imageToUpload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Upload"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              imageToUpload != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.file(
                        imageToUpload!,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.all(20.0),
                      height: 200,
                      width: double.infinity,
                      color: Colors.red,
                    ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final image = await getImage();
                    setState(() {
                      imageToUpload = File(image!.path);
                    });
                  },
                  child: const Text("Seleccionar Imagen")),
              ElevatedButton(
                  onPressed: () async {
                    if (imageToUpload == null) {
                      return;
                    }
                    final uploaded = await uploadImage(imageToUpload!);

                    if (uploaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.fixed,
                          content: Text('¡Imagen subida correctamente!'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            behavior: SnackBarBehavior.fixed,
                            content: Text("¡Chinetas, no se subió!")),
                      );
                    }
                  },
                  child: const Text("Subir"))
            ],
          ),
        ),
      ),
    );
  }
}
