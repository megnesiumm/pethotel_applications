import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';
import 'package:petshop_applications/core/widgets/image_slider.dart';

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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/homepage1.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.65), // ปรับโปร่งใส
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [_buildHeader(context), const BottomBarWidget()],
            ),
          ),
        ],
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
              Positioned(
                top: 34,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'CAPSULE',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'bold',
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
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '1 ตัว',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'bold',
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

        Container(
          width: 280,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Color(0xFFD5BFF1), // แบบ hex
          ),
          child: Center(
            child: Text(
              'ราคา 200 บาท/คืน',

              style: TextStyle(
                fontFamily: 'bold',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "ชามอาหาร ชามน้ำ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Regular',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "กระบะทราย พร้อมที่ตักส่วนตัว",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Regular',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, size: 20, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  "กล่องนอน หลุมใส แผ่นลับเล็บ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Regular',
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        const ImageSliderBox(),

        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              text: 'จองห้องพัก',
              fontWeight: FontWeight.bold,
              backgroundColor: const Color(0xFFAB80E3),
              onPressed: () {},
              width: 204,
              height: 54,
            ),
          ],
        ),
        const SizedBox(height: 80),
        SizedBox(
          height: screenHeight * 0.5,
          child: Stack(
            children: [
              Positioned(
                top: 34,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'OPEN ROOM',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'bold',
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
                      'assets/images/cat2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '3 ตัว',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'bold',
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

        Container(
          width: 280,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Color(0xFFD5BFF1), // แบบ hex
          ),
          child: Center(
            child: Text(
              'ราคา 200 บาท/คืน',
              style: TextStyle(
                fontFamily: 'bold',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    ),
  );
}
