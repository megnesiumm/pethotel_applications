import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แกลลอรี่และรีวิว')),
      body: Center(child: Text('แกลลอรี่และรีวิว จะมาเร็วๆ นี้!')),
    );
  }
}
