import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/appbar_widget.dart';
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
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
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
                    child: _buildCircleImage('assets/images/catroom1.png'),
                  ),

                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: _buildCircleImage('assets/images/cat2.png'),
                  ),

                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: _buildCircleImage('assets/images/cat3.png'),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 10),
                    child: _buildCircleImage('assets/images/cat4.png'),
                  ),
                  const SizedBox(height: 40),

                  Container(height: 200, color: Colors.white.withOpacity(0.3)),
                ],
              ),
            ),

            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCircleImage(String imagePath) {
  return Align(
    alignment: Alignment.topCenter,
    child: Opacity(
      opacity: 0.8, // ใส่ opacity ที่นี่
      child: ClipOval(
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  );
}

// ตัวอย่างหน้ารายละเอียดที่แสดงเมื่อเลือกเมนู
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
