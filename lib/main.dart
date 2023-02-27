import 'package:flutter/material.dart';
import 'package:flutter_1/BNavigation/bottom_nav.dart';
import 'package:flutter_1/BNavigation/routes.dart';

//Paquetes firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_1/services/notification_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio',
      theme: ThemeData(
        //color del tema
        primarySwatch: Colors.blue,
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int index = 0;
  BNavigation? myBNB;

  @override
  void initState() {
    myBNB = BNavigation(currenIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 90.0, bottom: 20),
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Tesla_T_symbol.svg/800px-Tesla_T_symbol.svg.png"),
            ),
            const Text(
              "Tesla",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ],
        ),
      )),
      //appBar: AppBar(
      //  backgroundColor: Color.fromARGB(255, 0, 110, 255),
      //  title: const Text("Inicio 🏚"),
      //  centerTitle: true,
      //),
      // body: cuerpo(context),
      body: Routes(index: index),
      bottomNavigationBar: myBNB,
    );
  }
}

//flutter run -d chrome --no-sound-null-safety --web-renderer=html  
