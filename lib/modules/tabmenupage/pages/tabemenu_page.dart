import 'package:flutter/material.dart';
import 'package:petshop_applications/core/widgets/drawer_widget.dart';
import 'package:petshop_applications/modules/about_page/pages/about_page.dart';
import 'package:petshop_applications/modules/detail_page/pages/detail_page.dart';
import 'package:petshop_applications/modules/gallery_review_page/pages/gallery_page.dart';
import 'package:petshop_applications/modules/home_page/pages/home_page.dart';
import 'package:petshop_applications/modules/room_page/pages/room_page.dart';
import 'package:petshop_applications/modules/services_page/pages/services_page.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
        targetPage = PageDetail();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
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
