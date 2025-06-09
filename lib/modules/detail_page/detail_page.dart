import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final String pageName;

  const PageDetail({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(
        child: Text(
          'กำลังอยู่ที่หน้า: $pageName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
