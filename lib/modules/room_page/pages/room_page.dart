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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
      ),
   
      Positioned(
        top: 74,
        left: MediaQuery.of(context).size.width / 2 - 180,
        child: Container(
          width: 360,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/backgroundlogin.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
