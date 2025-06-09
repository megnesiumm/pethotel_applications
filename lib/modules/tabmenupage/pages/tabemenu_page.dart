import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';
import 'package:petshop_applications/modules/about_page/about_page.dart';
import 'package:petshop_applications/modules/detail_page/detail_page.dart';
import 'package:petshop_applications/modules/gallery_review_page/gallery_page.dart';
import 'package:petshop_applications/modules/home_page/home_page.dart';
import 'package:petshop_applications/modules/login/pages/login_page.dart';
import 'package:petshop_applications/modules/room_page/room_page.dart';
import 'package:petshop_applications/modules/services_page/services_page.dart';

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

  void _goToPage(String pageName) {
    Widget targetPage;

    switch (pageName) {
      case 'หน้าแรก':
        targetPage = TabMenuPage(
          username: widget.username,
          avatarUrl: widget.avatarUrl,
        );
        break;
      case 'ห้องพัก':
        targetPage = const RoomPage();
        break;
      case 'บริการอื่นๆ':
        targetPage = const ServicesPage();
        break;
      case 'แกลลอรี่และรีวิว':
        targetPage = const GalleryPage();
        break;
      case 'เกี่ยวกับเรา':
        targetPage = const AboutPage();
        break;
      default:
        targetPage = PageDetail(pageName: pageName);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
       
        drawer: CustomDrawer(onMenuItemTapped: _goToPage),
        body: Stack(children: [HomePage()]),
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
              opacity: 0.8,
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
