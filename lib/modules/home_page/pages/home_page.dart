import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(currentPage: 'หน้าแรก'),
      appBar: CustomAppBar(
        avatarUrl: 'https://i.pravatar.cc/300',
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onLogoutPressed:
            () => Navigator.pushReplacementNamed(context, '/login'),
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
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            child: FeatureItem(
              imagePath: entry.value[0],
              label: entry.value[1],
            ),
          ),
        )
        .toList();
  }

  Widget _buildPromotionSection(BuildContext context) {
    return Column(
      children: [
        // Promotion 1: CAPSULE ROOM
        const SizedBox(height: 55),
        PromotionItem(
          titles: ['PROMOTION !'], // จะติดกับ priceWidget
          priceWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('CAPSULE ROOM 7 วัน เพียงแค่ ', style: _subtitleStyle),
                  Text(
                    '999',
                    style: TextStyle(
                      fontFamily: 'PalanquinDark',
                      fontSize: 32,
                      color: Color(0xFFFF5E5E),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '฿',
                    style: TextStyle(
                      fontFamily: 'RoundedMplus1c',
                      fontSize: 32,
                      color: Color(0xFFFF5E5E),
                    ),
                  ),
                ],
              ),
              const Text('สำหรับแมว S (1 CAT)', style: _subtitleStyle),
            ],
          ),

          imageAssets: [
            'assets/images/pomotion1.png',
            'assets/images/pomotion2.png',
          ],

          buttonText: 'จองเลย',
        ),

        const SizedBox(height: 40),

        // Promotion 2: อาบน้ำ + ตัดขน
        PromotionItem(
          titles: ['อาบน้ำ + ตัดขน วันนี้'],
          priceWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text('เพียงแค่', style: _subtitleStyle),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '500',
                    style: TextStyle(
                      fontFamily: 'PalanquinDark',
                      fontSize: 40,
                      color: Color(0xFFFF5E5E),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '฿',
                    style: TextStyle(
                      fontFamily: 'RoundedMplus1c',
                      fontSize: 40,
                      color: Color(0xFFFF5E5E),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text('เท่านั้น !!!', style: _subtitleStyle),
              ),
            ],
          ),
          buttonText: 'จองเลย',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

// Widget สำหรับ Feature Item
class FeatureItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const FeatureItem({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
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

// Widget สำหรับ Promotion Item
class PromotionItem extends StatelessWidget {
  final List<String>? imageAssets; // เพิ่มรองรับหลายรูป
  final List<String>? titles; // รองรับหลายข้อความ
  final String buttonText;
  final Widget? priceWidget;

  const PromotionItem({
    super.key,
    this.imageAssets,
    this.titles,
    required this.buttonText,
    this.priceWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titles != null)
          for (var t in titles!) ...[Text(t, style: _titleStyle)],
        if (priceWidget != null) ...[priceWidget!],
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: buttonText,
          fontWeight: FontWeight.bold,
          backgroundColor: const Color(0xFFFF7B61FF),
          onPressed: () {},
          width: 196,
          height: 50,
        ),
        const SizedBox(height: 110),
        if (imageAssets != null)
          for (var img in imageAssets!) ...[
            const SizedBox(height: 28),
            Image.asset(img, width: MediaQuery.of(context).size.width * 0.8),
          ],
      ],
    );
  }
}

const _titleStyle = TextStyle(
  fontSize: 32,
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
