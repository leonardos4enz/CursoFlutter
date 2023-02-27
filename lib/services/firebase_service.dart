import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  queryPeople.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": documento.id,
    };
    people.add(person);
  });

  //await Future.delayed(const Duration(seconds: 2));
  return people;
}

//Guardar un nombre en la base de datos
Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});
}

Future<void> editPeople(String uid, String newname) async {
  await db.collection("people").doc(uid).set({"name": newname});
}

Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}
