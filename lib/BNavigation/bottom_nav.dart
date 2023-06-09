import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BNavigation extends StatefulWidget {
  final Function currenIndex;
  const BNavigation({Key? key, required this.currenIndex}) : super(key: key);

  @override
  _BNavigationState createState() => _BNavigationState();
}

class _BNavigationState extends State<BNavigation> {
  int _actualPage = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
            widget.currenIndex(i);
          });
        },
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Legal"),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: "Alert"),
          BottomNavigationBarItem(icon: Icon(Icons.egg), label: "Huevo"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lista"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_very_satisfied), label: "Giphy"),
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard), label: "Nav"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnet), label: "Param"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.fire), label: "Firebase"),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera), label: "Galería"),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: "Upload"),
        ]);
  }
}
