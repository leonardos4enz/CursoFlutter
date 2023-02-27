import 'package:flutter/material.dart';

class Page09 extends StatefulWidget {
  final String texto;
  const Page09(this.texto, {super.key});

  @override
  State<Page09> createState() => _Page09State();
}

class _Page09State extends State<Page09> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pasar información"),
      ),
      body: Center(
        child: Container(child: Text(widget.texto)),
      ),
    );
  }
}
