import 'package:flutter/material.dart';
import 'package:flutter_1/pages/add_name_screen.dart';
import 'package:flutter_1/pages/edit_name_screen.dart';
import 'package:flutter_1/services/firebase_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page10 extends StatefulWidget {
  const Page10({super.key});

  @override
  State<Page10> createState() => _Page10State();
}

class _Page10State extends State<Page10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Firebase"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: 200,
              maxHeight: 400,
            ),
            child: FutureBuilder(
              future: getPeople(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          deletePeople(snapshot.data?[index]['uid']);
                          snapshot.data?.removeAt(index);
                        },
                        confirmDismiss: (direction) async {
                          bool result = false;

                          result = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "¿Seguro que quieres eliminar a ${snapshot.data?[index]['name']}"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          return Navigator.pop(context, false);
                                        },
                                        child: const Text("Cancelar")),
                                    TextButton(
                                        onPressed: () {
                                          return Navigator.pop(context, true);
                                        },
                                        child: const Text(
                                          "Eliminar",
                                          style: TextStyle(color: Colors.red),
                                        ))
                                  ],
                                );
                              });

                          return result;
                        },
                        background: Container(
                          child: Icon(FontAwesomeIcons.deleteLeft),
                          color: Colors.red,
                        ),
                        direction: DismissDirection.endToStart,
                        key: Key(snapshot.data?[index]['uid']),
                        child: ListTile(
                          title: Text(snapshot.data?[index]['name']),
                          onTap: (() async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditName(
                                        snapshot.data?[index]['uid'],
                                        snapshot.data?[index]['name'])));
                            setState(() {});
                          }),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddName()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
