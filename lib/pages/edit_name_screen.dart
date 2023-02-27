import 'package:flutter/material.dart';
import 'package:flutter_1/services/firebase_service.dart';

class EditName extends StatefulWidget {
  final String mapeo;
  final String uid;
  const EditName(this.uid, this.mapeo, {super.key});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    //final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = widget.mapeo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar nombre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: "Ingrese el nuevo nombre"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await editPeople(widget.uid, nameController.text)
                      .then((_) => {Navigator.pop(context)});
                },
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
