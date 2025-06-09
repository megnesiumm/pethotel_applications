import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        avatarUrl: 'https://i.pravatar.cc/300',
        onMenuPressed: () {
          Scaffold.of(context).openDrawer();
        },
        onLogoutPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            ..._buildFeatures(),
            _buildPromotionSection(context),
            const BottomBarWidget(),
          ],
        ),
      ),
    );
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
          top: 20,
          left: 20,
          child: Column(
            children: const [
              Text('ZZZ', style: _headerTextStyle),
              Text('HOTEL', style: _headerTextStyle),
            ],
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

  List<Widget> _buildFeatures() {
    const features = [
      ['assets/images/catroom1.png', 'พี่เลี้ยงดูแล 24 ชั่วโมง'],
      ['assets/images/cat2.png', 'ผลิตภัณฑ์เป็นมิตรต่อสัตว์เลี้ยง'],
      ['assets/images/cat3.png', 'เสิร์ฟของว่างต้นข้าวสาลีออแกนิก'],
      ['assets/images/cat4.png', 'กล้อง CCTV ดูผ่านแอพได้ตลอด 24 ชั่วโมง'],
    ];

    return features
        .asMap()
        .entries
        .map(
          (entry) => Transform.translate(
            offset: Offset(0, -50 + (entry.key * 20)),
            child: _buildCircleImageWithText(entry.value[0], entry.value[1]),
          ),
        )
        .toList();
  }

  Widget _buildPromotionSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text('PROMOTION !', style: _titleStyle),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('CAPSULE ROOM 7 วัน เพียง', style: _titleStyle),
            SizedBox(width: 4),
            Text(
              ' 999B ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('สำหรับแมว S (1 CAT)', style: _subtitleStyle),
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: 'จองเลย',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: const Color(0xFFFF7B61FF),
          onPressed: () {},
          width: 196,
          height: 50,
        ),
        const SizedBox(height: 100),
        Image.asset(
          'assets/images/pomotion1.png',
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        const SizedBox(height: 28),
        Image.asset(
          'assets/images/pomotion2.png',
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        const SizedBox(height: 60),
        const Text('อาบน้ำ + ตัดขน วันนี้ ', style: _titleStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 18),
              child: Text('เพียงแค่', style: _subtitleStyle),
            ),
            Transform.translate(
              offset: const Offset(0, 8),
              child: Image.asset('assets/images/price.png', height: 80),
            ),
            const Text('เท่านั้น !!!', style: _subtitleStyle),
          ],
        ),
        CustomElevatedButton(
          text: 'จองเลย',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: const Color(0xFFFF7B61FF),
          onPressed: () {},
          width: 196,
          height: 50,
        ),
        Container(height: 140, color: Colors.white.withOpacity(0.3)),
      ],
    );
  }

  Widget _buildCircleImageWithText(String imagePath, String label) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipOval(
        child: Container(
          width: 180,
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.8,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff636363),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _titleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const _subtitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const _headerTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
