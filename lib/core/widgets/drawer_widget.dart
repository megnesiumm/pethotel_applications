import 'package:flutter/material.dart';
import 'package:petshop_applications/modules/about_page/pages/about_page.dart';
import 'package:petshop_applications/modules/detail_page/pages/detail_page.dart';
import 'package:petshop_applications/modules/gallery_review_page/pages/gallery_page.dart';
import 'package:petshop_applications/modules/home_page/pages/home_page.dart';
import 'package:petshop_applications/modules/room_page/pages/room_page.dart';
import 'package:petshop_applications/modules/services_page/pages/services_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _goToPage(BuildContext context, String pageName) {
    Widget targetPage;

    switch (pageName) {
      case 'หน้าแรก':
        targetPage = HomePage();
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
    return Drawer(
      width: double.infinity,
      child: Container(
        color: const Color(0xFFEEBDCFF),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logocat.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                _buildMenuItem(context, 'หน้าแรก'),
                _buildMenuItem(context, 'ห้องพัก'),
                _buildMenuItem(context, 'บริการอื่นๆ'),
                _buildMenuItem(context, 'แกลลอรี่และรีวิว'),
                _buildMenuItem(context, 'เกี่ยวกับเรา'),
              ],
            ),
            Positioned(
              top: 30,
              right: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.disabled_by_default_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context); // ปิด drawer
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Navigator.pop(context); // ปิด drawer ก่อน
        _goToPage(context, title); // ไปหน้าใหม่
      },
    );
  }
}
