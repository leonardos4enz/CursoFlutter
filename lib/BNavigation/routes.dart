import 'package:flutter/material.dart';
import 'package:flutter_1/pages/firebase_upload.dart';
import 'package:flutter_1/pages/page01.dart';
import 'package:flutter_1/pages/page02.dart';
import 'package:flutter_1/pages/page03.dart';
import 'package:flutter_1/pages/page04.dart';
import 'package:flutter_1/pages/page05.dart';
import 'package:flutter_1/pages/page06.dart';
import 'package:flutter_1/pages/page07.dart';
import 'package:flutter_1/pages/page08.dart';
import 'package:flutter_1/pages/page10.dart';
import 'package:flutter_1/pages/page11.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      Page01(),
      const Page02(),
      Page03(),
      Page04(),
      Page05(),
      Page06(),
      Page07(),
      const Page08(),
      const Page10(),
      const Page11(),
      const FirebaseUpload()
    ];
    return myList[index];
  }
}
