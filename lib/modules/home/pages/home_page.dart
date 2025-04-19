import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
import 'package:petshop_applications/core/widgets/custom_elevated_button.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';
import 'package:petshop_applications/core/widgets/bottom_bar_widget.dart';
import 'package:petshop_applications/modules/login/pages/login_page.dart';

class TabMenuPage extends StatefulWidget {
  final String username;
  final String avatarUrl;

  const TabMenuPage({
    super.key,
    required this.username,
    required this.avatarUrl,
  });

  @override
  State<StatefulWidget> createState() {
    return _TabMenuPageState();
  }
}

class _TabMenuPageState extends State<TabMenuPage> {
  late String _avatarUrl;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _avatarUrl = widget.avatarUrl;
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _goToPage(String pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageDetail(pageName: pageName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          avatarUrl: _avatarUrl,
          onMenuPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          onLogoutPressed: _logout,
        ),
        drawer: CustomDrawer(onMenuItemTapped: _goToPage),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
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
                          children: [
                            Text(
                              'ZZZ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'HOTEL',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
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
                            boxShadow: [
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
                  ),

                  Transform.translate(
                    offset: const Offset(0, -50),
                    child: _buildCircleImageWithText(
                      'assets/images/catroom1.png',
                      'พี่เลี้ยงดูแล 24 ชั่วโมง',
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: _buildCircleImageWithText(
                      'assets/images/cat2.png',
                      'ผลิตภัณฑ์เป็นมิตรต่อสัตว์เลี้ยง',
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: _buildCircleImageWithText(
                      'assets/images/cat3.png',
                      'เสิร์ฟของว่างต้นข้าวสาลีออแกนิก',
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 10),
                    child: _buildCircleImageWithText(
                      'assets/images/cat4.png',
                      'กล้อง CCTV ดูผ่านแอพได้ตลอด 24 ชั่วโมง',
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'PROMOTION !',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CAPSULE ROOM 7 วัน เพียง', style: titleStyle),
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
                  SizedBox(height: 20),
                  Text(
                    'สำหรับแมว S (1 CAT)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    text: 'จองเลย',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor: const Color(0xFFFF7B61FF),
                    onPressed: () {},
                    width: 196,
                    height: 50,
                  ),
                  SizedBox(height: 100),
                  Image.asset(
                    'assets/images/pomotion1.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  const SizedBox(height: 28),
                  Image.asset(
                    'assets/images/pomotion2.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  SizedBox(height: 60),
                  Text('อาบน้ำ + ตัดขน วันนี้ ', style: titleStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Text(
                          'เพียงแค่',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 8),
                        child: Image.asset(
                          'assets/images/price.png',
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Text(
                        'เท่านั้น !!!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
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
                  const BottomBarWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const TextStyle titleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

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
              opacity: 0.8, // จางเฉพาะรูปเท่านั้น
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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

class PageDetail extends StatelessWidget {
  final String pageName;
  const PageDetail({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageName)),
      body: Center(child: Text('นี่คือหน้า $pageName')),
    );
  }
}
