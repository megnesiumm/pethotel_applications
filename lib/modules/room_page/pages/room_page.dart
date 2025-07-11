import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ห้องพัก')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 7),
            Positioned(
              top: 400,
              right: 30,
              child: Container(
                width: 280,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Color.fromRGBO(171, 128, 227, 0.5).withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    'ราคา 200 บาท/คืน',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text("ชามอาหาร ชามน้ำ"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text("กระบะทราย พร้อมที่ตักส่วนตัว"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text("กล่องนอน หลุมใส แผ่นลับเล็บ"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  return SizedBox(
    height: screenHeight * 0.5,
    child: Stack(
      children: [
        // พื้นหลังโปร่ง
        Positioned.fill(
          child: Opacity(
            opacity: 0.65,
            child: Image.asset(
              'assets/images/homepage1.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // ข้อความ CAPSULE
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'CAPSULE',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),

        // รูปแมว
        Positioned(
          top: 80,
          left: MediaQuery.of(context).size.width / 2 - 273 / 2,
          child: Container(
            width: 273,
            height: 353,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/cat4.png', fit: BoxFit.cover),
            ),
          ),
        ),

        Positioned(
          top: 40,
          left: 30,
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                '1 ตัว',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
