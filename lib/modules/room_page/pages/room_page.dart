import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        avatarUrl: 'https://i.pravatar.cc/300',
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onLogoutPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(context), BottomBarWidget()]),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  return SingleChildScrollView(
    child: Column(
      children: [
        // พื้นหลัง + ซ้อนภาพ + แคปซูล
        SizedBox(
          height: screenHeight * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.65,
                  child: Image.asset(
                    'assets/images/homepage1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                    child: Image.asset(
                      'assets/images/cat4.png',
                      fit: BoxFit.cover,
                    ),
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
        ),

        const SizedBox(height: 7),

        // กล่องราคา
        Container(
          width: 280,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Color.fromRGBO(171, 128, 227, 0.5),
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

        const SizedBox(height: 16),

        // รายการของแถม
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text("ชามอาหาร ชามน้ำ"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text("กระบะทราย พร้อมที่ตักส่วนตัว"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text("กล่องนอน หลุมใส แผ่นลับเล็บ"),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        // รูปภาพ catphoto
        Container(
          width: 273,
          height: 353,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/catphoto.png', fit: BoxFit.cover),
          ),
        ),

        const SizedBox(height: 20),
      ],
    ),
  );
}
