import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String pageName;
  const ProfilePage({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(child: Text('นี่คือหน้า $pageName')),
    );
  }
}
