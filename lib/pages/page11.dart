import 'package:flutter/material.dart';
import 'package:flutter_1/data/data.dart';
import 'package:flutter_1/pages/image_page.dart';

class Page11 extends StatefulWidget {
  const Page11({super.key});

  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Galería'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: GridView.extent(
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          maxCrossAxisExtent: 150,
          children: _imagesList,
        ));
  }

  List<Widget> get _imagesList {
    List<Widget> _listImages = [];

    for (var image in images) {
      _listImages.add(GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ImagePage(url: image))));
        },
        child: Hero(
          tag: image,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ));
    }

    return _listImages;
  }
}
