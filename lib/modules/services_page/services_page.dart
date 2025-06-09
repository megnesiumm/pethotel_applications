import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('บริการอื่นๆ')),
      body: Center(child: Text('บริการอื่นๆ จะมาเร็วๆ นี้!')),
    );
  }
}
