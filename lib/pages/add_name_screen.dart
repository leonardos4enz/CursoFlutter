import 'package:flutter/material.dart';
import 'package:flutter_1/services/firebase_service.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AddName"),
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
                  await addPeople(nameController.text)
                      .then((_) => {Navigator.pop(context)});
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
