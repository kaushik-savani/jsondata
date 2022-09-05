import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class demo6 extends StatefulWidget {
  const demo6({Key? key}) : super(key: key);

  @override
  State<demo6> createState() => _demo6State();
}

class _demo6State extends State<demo6> {
  List someImages=[];
  @override
  void initState() {
    super.initState();
    _initImages();
  }
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.png'))
        .toList();
    setState(() {
      someImages = imagePaths;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.builder(itemCount: someImages.length,itemBuilder: (context, index) {
            return Container(
              child: Image(image: AssetImage(someImages[index]),fit: BoxFit.fill,height: 100,width: 100,),
            );
          },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              )),
    );
  }
}
