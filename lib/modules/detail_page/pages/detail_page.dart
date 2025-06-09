import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
   const PageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('  รายละเอียด')),
      body: Center(child: Text('  รายละเอียดจะมาเร็วๆ นี้!')),
    );
  }
}
