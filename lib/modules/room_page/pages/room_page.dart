import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ห้องพัก')),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(context)]),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Stack(
    children: [
      Opacity(
        opacity: 0.65,
        child: Image.asset(
          'assets/images/homepage1.png',

          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
      ),
      Center(
        child: Text(
          'CAPSULE',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [],
          ),
        ),
      ),
      Center(
        child: Container(
          width: 273,
          height: 353,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/cat4.png',
              width: 273,
              height: 353,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
