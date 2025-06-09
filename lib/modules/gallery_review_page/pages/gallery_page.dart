import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('แกลลอรี่และรีวิว')),
      body: Center(child: const Text('แกลลอรี่และรีวิว จะมาเร็วๆ นี้!')),
    );
  }
}
